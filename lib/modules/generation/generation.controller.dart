import 'package:get/get.dart';

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
    } finally {
      isLoading.value = false;
    }
  }
}
