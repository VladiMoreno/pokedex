import 'package:get/get.dart';
import 'package:pokedex/utils/catch_error.util.dart';

import 'generation.service.dart';

class GeneartionController extends GetxController {
  GenerationService service = GenerationService();

  var isLoading = RxBool(false);
  var generationsInfo = RxList([]);

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      final response = await service.getGenerations();

      generationsInfo.value = response;

      super.onReady();
    } catch (e) {
      isLoading.value = false;
      CatchErrorManagement(
        error: e,
        function: () {
          Get.offNamed('/home');
        },
      );
    } finally {
      isLoading.value = false;
    }
  }
}
