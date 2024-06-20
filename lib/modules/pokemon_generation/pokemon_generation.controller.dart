import 'package:get/get.dart';

import 'pokemon_generation.services.dart';

class PokemonGenerationController extends GetxController {
  PokemonGenerationService service = PokemonGenerationService();

  String? id = Get.parameters['id'];
  var isLoading = RxBool(false);
  var pokemonsGeneralInfo = RxList([]);
  var pokemonsInfo = RxList([]);
  var total = RxInt(0);
  var page = RxInt(2);
  var initialValue = Rx(0);

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      if (id == null || int.tryParse(id!) == null) {
        throw Exception('Verifica el ID del pokemon por favor');
      }

      await getPokemonsByGeneration(id: int.parse(id!));

      super.onReady();
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future getPokemonsByGeneration({required int id}) async {
    final response = await service.getPokemonsByGeneration(id);

    total.value = response['total'];
    pokemonsGeneralInfo.value = response['data'];

    List<String> pokemonNames = [];

    for (var i = initialValue.value; i < (page.value * 5); i++) {
      pokemonNames.add(response['data']['pokemonSpecies'][i]['name']);
    }

    initialValue.value = page.value * 5;

    page.value += 1;

    final pokemons = await service.getPokemonsInfo(pokemonNames);

    pokemonsInfo.addAll(pokemons);
  }
}
