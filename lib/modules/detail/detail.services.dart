import 'package:get/get.dart';
import 'package:pokedex/config/api.config.dart';
import 'package:pokedex/config/endpoints_api.config.dart';
import 'package:pokedex/utils/generate_final_url.util.dart';
import 'package:pokedex/utils/logg_message.util.dart';

import './dtos/pokemon.dto.dart';
import './dtos/pokemon_species.dto.dart';
import './dtos/pokemon_evolution.dto.dart';

class DetailServices extends GetxService {
  final apiService = APIService();

  Future getPokemonInformation(String pokemonName) async {
    try {
      final params = <String, dynamic>{
        'pokemon_name': pokemonName,
      };

      String finalUrl = generateFinalUrl(getPokemonInfo, params);

      final response = await apiService.get(finalUrl);

      PokemonInformation pokemonInformation =
          PokemonInformation.fromJson(response);

      return pokemonInformation.toJson();
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getPokemonInformation del archivo detail.service',
        param: e,
      );
      rethrow;
    }
  }

  Future getPokemonSpecieInformation(int pokemonId) async {
    try {
      final params = <String, dynamic>{
        'pokemon_id': pokemonId,
      };

      String finalUrl = generateFinalUrl(getPokemonSpecieInfo, params);

      final response = await apiService.get(finalUrl);

      PokemonSpeciesDTO pokemonSpeciesDTO =
          PokemonSpeciesDTO.fromJson(response);

      return pokemonSpeciesDTO.toJson();
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getPokemonSpecieInformation del archivo detail.service',
        param: e,
      );
      rethrow;
    }
  }

  Future getPokemonEvolution(int pokemonId) async {
    try {
      final params = <String, dynamic>{
        'pokemon_id': pokemonId,
      };

      String finalUrl = generateFinalUrl(getEvolutionInfo, params);

      final response = await apiService.get(finalUrl);

      PokemonEvolutionDTO pokemonEvolutionDTO =
          PokemonEvolutionDTO.fromJson(response);

      return pokemonEvolutionDTO.toJson();
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getPokemonEvolution del archivo detail.service',
        param: e,
      );
      rethrow;
    }
  }
}
