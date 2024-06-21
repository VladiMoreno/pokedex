import 'package:get/get.dart';
import 'package:pokedex/config/states.config.dart';
import 'package:pokedex/constants/actions_state.constants.dart';

import 'pokemon_type.services.dart';

class PokemonTypeController extends GetxController {
  final PokemonTypeService service = PokemonTypeService();

  String? id = Get.parameters['id'];
  var isLoading = RxBool(false);
  var pokemonsTypeInfo = RxList([]);
  var pokemonsInfo = RxList([]);
  var total = RxInt(0);
  var page = RxInt(2);
  var initialValue = RxInt(0);

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      if (id == null || int.tryParse(id!) == null) {
        throw Exception('Verifica el ID del pokemon por favor');
      }
      List? pokemonsState = AppStates().pokemonTypeState.pokemonsInfo[id];
      List? pokemonsGeneralState =
          AppStates().pokemonTypeState.pokemonsTypeInfo[id];
      Map? paginationState = AppStates().pokemonTypeState.paginationInfo[id];

      if (pokemonsState != null &&
          pokemonsGeneralState != null &&
          paginationState != null) {
        pokemonsTypeInfo.value = pokemonsGeneralState;
        pokemonsInfo.value = pokemonsState;

        page.value = paginationState["page"];
        initialValue.value = paginationState["initialValue"];
      } else {
        await getPokemonsByType(id: int.parse(id!));
      }

      super.onReady();
    } catch (e) {
      isLoading.value = false;
    } finally {
      AppStates().pokemonTypeState.action(initialize, []);
      isLoading.value = false;
    }
  }

  Future getPokemonsByType({required int id}) async {
    try {
      isLoading.value = true;

      final response = await service.getPokemonsByType(id);

      total.value = response['total'];
      pokemonsTypeInfo.value = response['data']['pokemon'];

      List<String> pokemonNames = [];

      for (var i = initialValue.value; i < (page.value * 5); i++) {
        pokemonNames.add(response["data"]["pokemon"][i]["pokemon"]["name"]);
      }

      initialValue.value = page.value * 5;

      page.value += 1;

      final pokemons = await service.getPokemonsInfo(pokemonNames);

      pokemonsInfo.addAll(pokemons);

      final data = {
        "id": id,
        "pokemon": response['data']['pokemon'],
        "pokemons": pokemons,
        "page": page.value,
        "initialValue": initialValue.value,
      };

      AppStates().pokemonTypeState.action(set, data);
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future getPokemonsPagintaion() async {
    try {
      isLoading.value = true;

      List info = pokemonsTypeInfo;

      List<String> pokemonNames = [];

      for (var i = initialValue.value; i < (page.value * 5); i++) {
        pokemonNames.add(info[i]["pokemon"]["name"]);
      }

      initialValue.value = page.value * 5;

      page.value += 1;

      final pokemons = await service.getPokemonsInfo(pokemonNames);

      pokemonsInfo.addAll(pokemons);

      final data = {
        "id": id,
        "pokemons": pokemons,
        "page": page.value,
        "initialValue": initialValue.value,
      };

      AppStates().pokemonTypeState.action(add, data);
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
