import 'package:get/get.dart';
import 'package:pokedex/config/states.config.dart';
import 'package:pokedex/constants/actions_state.constants.dart';

import 'detail.services.dart';

class DetailController extends GetxController {
  final DetailServices detailServices = DetailServices();

  String? id = Get.parameters['id'];
  String? name = Get.parameters['name'];

  var isLoading = RxBool(false);

  var pokemonInfo = RxMap({});
  var pokemonSpecieInfo = RxMap({});
  var pokemonEvolutionInfo = RxMap({});

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      if (id == null || int.tryParse(id!) == null) {
        throw Exception('Verifica el ID del pokemon por favor');
      }

      if (name == null) {
        throw Exception('Verifica el Name del pokemon por favor');
      }

      Map? info = AppStates().detailState.info[id];

      if (info != null) {
        pokemonInfo.value = info["pokemonInfo"];
        pokemonSpecieInfo.value = info["pokemonSpecieInfo"];
        pokemonEvolutionInfo.value = info["pokemonEvolutionInfo"];
      } else {
        await getPokemonInformation(name: name!, id: int.parse(id!));
      }

      super.onReady();
    } catch (e) {
      isLoading.value = false;
    } finally {
      AppStates().detailState.action(initialize, []);
      isLoading.value = false;
    }
  }

  Future<void> getPokemonInformation({
    required String name,
    required int id,
  }) async {
    final gPI = await detailServices.getPokemonInformation(name);
    final gPSI = await detailServices.getPokemonSpecieInformation(id);
    final gPE = await detailServices.getPokemonEvolution(
      gPSI['evolution_chain']['url'],
    );

    final data = {
      "id": id,
      "pokemonInfo": gPI,
      "pokemonSpecieInfo": gPSI,
      "pokemonEvolutionInfo": gPE,
    };

    AppStates().detailState.action(add, data);

    pokemonInfo.value = gPI;
    pokemonSpecieInfo.value = gPSI;
    pokemonEvolutionInfo.value = gPE;
  }
}
