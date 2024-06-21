import 'package:get/get.dart';
import 'package:pokedex/config/api.config.dart';
import 'package:pokedex/config/endpoints_api.config.dart';
import 'package:pokedex/modules/home/home.dto.dart';
import 'package:pokedex/utils/generate_final_url.util.dart';
import 'package:pokedex/utils/logg_message.util.dart';

import 'pokemon_type.dto.dart';

class PokemonTypeService extends GetxService {
  final apiService = APIService();

  Future getPokemonsByType(int type) async {
    try {
      final params = <String, dynamic>{
        'type': type,
      };

      String finalUrl = generateFinalUrl(getPokemonsByTypeInfo, params);

      final response = await apiService.get(finalUrl);

      PokemonTypeDTO pokemonTypeDTO = PokemonTypeDTO.fromJson(response);

      return {
        "data": pokemonTypeDTO.toJson(),
        "total": pokemonTypeDTO.pokemon.length,
      };
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getPokemonsByType del archivo pokemon_type.service',
        param: e,
      );
      rethrow;
    }
  }

  Future getPokemonsInfo(List<String> pokemonsName) async {
    try {
      List data = [];

      for (var element in pokemonsName) {
        final params = <String, dynamic>{
          'pokemon_name': element,
        };

        String finalUrl = generateFinalUrl(getPokemonInfo, params);

        final response = await apiService.get(finalUrl);

        data.add(response);
      }

      List<ResultsDTO> listResultDTO =
          data.map((e) => ResultsDTO.fromJson(e)).toList();

      return listResultDTO.map((e) => e.toJson()).toList();
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getPokemonsInfo del archivo pokemon_type.service',
        param: e,
      );
      rethrow;
    }
  }
}
