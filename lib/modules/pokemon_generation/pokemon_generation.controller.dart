import 'package:get/get.dart';
import 'package:pokedex/config/states.config.dart';
import 'package:pokedex/constants/actions_state.constants.dart';
import 'package:pokedex/utils/catch_error.util.dart';

import 'pokemon_generation.services.dart';

class PokemonGenerationController extends GetxController {
  PokemonGenerationService service = PokemonGenerationService();

  String? id = Get.parameters['id'];
  var isLoading = RxBool(false);
  var pokemonsGeneralInfo = RxList([]);
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
      List? pokemonsState = AppStates().pokemonGenerationState.pokemonsInfo[id];
      List? pokemonsGeneralState =
          AppStates().pokemonGenerationState.pokemonsGeneralInfo[id];
      Map? paginationState =
          AppStates().pokemonGenerationState.paginationInfo[id];

      if (pokemonsState != null &&
          pokemonsGeneralState != null &&
          paginationState != null) {
        pokemonsGeneralInfo.value = pokemonsGeneralState;
        pokemonsInfo.value = pokemonsState;

        page.value = paginationState["page"];
        initialValue.value = paginationState["initialValue"];
      } else {
        await getPokemonsByGeneration(id: int.parse(id!));
      }

      super.onReady();
    } catch (e) {
      isLoading.value = false;
      CatchErrorManagement(
        error: e,
      );
    } finally {
      AppStates().pokemonGenerationState.action(initialize, []);
      isLoading.value = false;
    }
  }

  Future getPokemonsByGeneration({required int id}) async {
    try {
      isLoading.value = true;

      final response = await service.getPokemonsByGeneration(id);

      total.value = response['total'];
      pokemonsGeneralInfo.value = response['data']['pokemon_species'];

      List<String> pokemonNames = [];

      for (var i = initialValue.value; i < (page.value * 5); i++) {
        pokemonNames.add(response['data']['pokemon_species'][i]['name']);
      }

      initialValue.value = page.value * 5;

      page.value += 1;

      final pokemons = await service.getPokemonsInfo(pokemonNames);

      pokemonsInfo.addAll(pokemons);

      final data = {
        "id": id,
        "pokemon_species": response['data']['pokemon_species'],
        "pokemons": pokemons,
        "page": page.value,
        "initialValue": initialValue.value,
      };

      AppStates().pokemonGenerationState.action(set, data);
    } catch (e) {
      isLoading.value = false;
      CatchErrorManagement(
        error: e,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future getPokemonsPagintaion() async {
    try {
      isLoading.value = true;

      List info = pokemonsGeneralInfo;

      List<String> pokemonNames = [];

      for (var i = initialValue.value; i < (page.value * 5); i++) {
        pokemonNames.add(info[i]['name']);
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

      AppStates().pokemonGenerationState.action(add, data);
    } catch (e) {
      isLoading.value = false;
      CatchErrorManagement(
        error: e,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
