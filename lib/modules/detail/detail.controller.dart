import 'package:get/get.dart';

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

      await getPokemonInformation(name: name!, id: int.parse(id!));

      super.onReady();
    } catch (e) {
      isLoading.value = false;
    } finally {
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

    pokemonInfo.value = gPI;
    pokemonSpecieInfo.value = gPSI;
    pokemonEvolutionInfo.value = gPE;
  }
}
