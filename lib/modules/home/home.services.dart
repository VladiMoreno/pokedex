import 'package:get/state_manager.dart';
import 'package:pokedex/config/api.config.dart';
import 'package:pokedex/config/endpoints_api.config.dart';
import 'package:pokedex/utils/generate_final_url.util.dart';
import 'package:pokedex/utils/logg_message.util.dart';

import 'home.dto.dart';

class HomeService extends GetxService {
  final apiService = APIService();

  Future getPokemons({offest = 0, limit = 16}) async {
    try {
      final params = <String, dynamic>{
        'limitValue': limit,
        'offsetValue': offest
      };

      String finalUrl = generateFinalUrl(getPokemonsPaginated, params);

      final response = await apiService.get(finalUrl);

      HomeDTO homeDTO = HomeDTO.fromJson(response);

      List data = [];

      for (var element in homeDTO.results) {
        final response = await apiService.getFullURL(element.url);

        data.add(response);
      }

      List<ResultsDTO> listResultDTO =
          data.map((e) => ResultsDTO.fromJson(e)).toList();

      return listResultDTO.map((e) => e.toJson()).toList();
    } catch (e) {
      printMessageParam(
        message: 'Error en la función getPokemons del archivo home.service',
        param: e,
      );
      rethrow;
    }
  }
}
