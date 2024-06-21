import 'package:get/get.dart';
import 'package:pokedex/utils/catch_error.util.dart';

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
