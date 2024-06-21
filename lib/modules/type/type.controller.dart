import 'package:get/get.dart';

import 'type.service.dart';

class TypeController extends GetxController {
  final TypeService service = TypeService();

  var isLoading = RxBool(false);
  var typesInfo = RxList([]);

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      final response = await service.getTypesOfPokemons();

      typesInfo.value = response;

      super.onReady();
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
