import 'package:get/state_manager.dart';

import 'home.services.dart';

class HomeController extends GetxController {
  final HomeService service = HomeService();

  var isLoading = RxBool(false);
  var pokemonsInfo = RxList([]);

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      final response = await service.getPokemons();

      pokemonsInfo.value = response;

      super.onReady();
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
