import 'package:get/state_manager.dart';
import 'package:pokedex/config/api.config.dart';
import 'package:pokedex/config/endpoints_api.config.dart';
import 'package:pokedex/utils/generate_final_url.util.dart';
import 'package:pokedex/utils/logg_message.util.dart';

import 'home.dto.dart';

class HomeService extends GetxService {
  final apiService = APIService();

  Future getPokemons({offest = 0, limit = 10}) async {
    try {
      final params = <String, dynamic>{
        'limitValue': limit,
        'offsetValue': offest
      };

      String finalUrl = generateFinalUrl(getPokemonsPaginated, params);

      final response = apiService.get(finalUrl);

      HomeDTO homeDTO = HomeDTO.fromJson(response);

      return homeDTO;
    } catch (e) {
      printMessageParam(
        message: 'Error en la función getPokemons del archivo home.service',
        param: e,
      );
      rethrow;
    }
  }
}
