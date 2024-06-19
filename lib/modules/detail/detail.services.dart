import 'package:get/get.dart';
import 'package:pokedex/config/api.config.dart';
import 'package:pokedex/config/endpoints_api.config.dart';
import 'package:pokedex/utils/generate_final_url.util.dart';
import 'package:pokedex/utils/logg_message.util.dart';

class DetailServices extends GetxService {
  final apiService = APIService();

  Future getPokemonInformation(String pokemonName) async {
    try {
      final params = <String, dynamic>{
        'pokemon_name': pokemonName,
      };

      String finalUrl = generateFinalUrl(getPokemonInfo, params);

      final response = await apiService.get(finalUrl);
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
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getPokemonSpecieInformation del archivo detail.service',
        param: e,
      );
      rethrow;
    }
  }
}
