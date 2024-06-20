import 'package:get/get.dart';
import 'package:pokedex/utils/image_generation.util.dart';
import 'package:pokedex/utils/logg_message.util.dart';

import 'generation.dto.dart';

class GenerationService extends GetxService {
  Future getGenerations() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      final response = imageGeneration;

      List<GenerationDTO> listGeneration =
          response.map((e) => GenerationDTO.fromJson(e)).toList();

      return listGeneration.map((e) => e.toJson()).toList();
    } catch (e) {
      printMessageParam(
        message:
            'Error en la función getGenerations del archivo generation.service',
        param: e,
      );
      rethrow;
    }
  }
}
