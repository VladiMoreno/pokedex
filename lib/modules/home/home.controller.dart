import 'package:get/get.dart';
import 'package:pokedex/config/states.config.dart';
import 'package:pokedex/constants/actions_state.constants.dart';
import 'package:pokedex/utils/catch_error.util.dart';

import 'home.services.dart';

class HomeController extends GetxController {
  final HomeService service = HomeService();

  var isLoading = RxBool(false);
  var pokemonsInfo = RxList([]);
  var page = RxInt(2);

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      if (!AppStates().homeState.isInitialized) {
        final response = await service.getPokemons();

        AppStates().homeState.action(set, response);

        pokemonsInfo.value = response;
      } else {
        pokemonsInfo.value = AppStates().homeState.info;
      }

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
      AppStates().homeState.action(initialize, []);
      isLoading.value = false;
    }
  }

  Future<void> getMorePokemons() async {
    try {
      isLoading.value = true;

      final response = await service.getPokemons(
        offest: page.value * 5,
        limit: 5,
      );

      pokemonsInfo.addAll(response);

      AppStates().homeState.action(add, response);

      int newPage = page.value + 1;

      page.value = newPage;
    } catch (e) {
      isLoading.value = false;
      CatchErrorManagement(
        error: e,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
