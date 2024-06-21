import 'package:get/get.dart';
import 'package:pokedex/config/api.config.dart';
import 'package:pokedex/config/endpoints_api.config.dart';
import 'package:pokedex/utils/logg_message.util.dart';

import 'type.dto.dart';

class TypeService extends GetxService {
  final apiService = APIService();

  Future getTypesOfPokemons() async {
    try {
      final response = await apiService.get(getTypesOfPokemonsInfo);

      List<TypeDTO> listTypeDTO = (response["results"] as List)
          .map((e) => TypeDTO.fromJson(e as Map<String, dynamic>))
          .toList();

      return listTypeDTO.map((e) => e.toJson()).toList();
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getTypesOfPokemons del archivo type.service',
        param: e,
      );
      rethrow;
    }
  }
}
