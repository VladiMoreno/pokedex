import 'package:get/get.dart';
import 'package:pokedex/config/api.config.dart';
import 'package:pokedex/config/endpoints_api.config.dart';
import 'package:pokedex/modules/home/home.dto.dart';
import 'package:pokedex/modules/pokemon_generation/pokemon_generation.dto.dart';
import 'package:pokedex/utils/generate_final_url.util.dart';
import 'package:pokedex/utils/logg_message.util.dart';

class PokemonGenerationService extends GetxService {
  final apiService = APIService();

  Future getPokemonsByGeneration(int generation) async {
    try {
      final params = <String, dynamic>{
        'generation': generation,
      };

      String finalUrl = generateFinalUrl(getPokemonsByGenerationInfo, params);

      final response = await apiService.get(finalUrl);

      GenerationDto generationDTO = GenerationDto.fromJson(response);

      return {
        "data": generationDTO.toJson(),
        "total": generationDTO.pokemonSpecies.length,
      };
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getPokemonsByGeneration del archivo pokemon_generation.service',
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
            'Error en la función getPokemonsInfo del archivo pokemon_generation.service',
        param: e,
      );
      rethrow;
    }
  }
}
