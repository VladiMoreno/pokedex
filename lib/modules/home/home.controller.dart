import 'package:get/state_manager.dart';

import 'home.services.dart';

class HomeController extends GetxController {
  final HomeService service = HomeService();

  var isLoading = RxBool(false);
  var pokemonsInfo = RxList([]);
  var page = RxInt(1);

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

  Future<void> getMorePokemons() async {
    try {
      isLoading.value = true;

      final response = await service.getPokemons(offest: page.value * 16);

      pokemonsInfo.addAll(response);

      int newPage = page.value + 1;

      page.value = newPage;
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
