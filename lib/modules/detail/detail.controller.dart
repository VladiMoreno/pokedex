import 'package:get/get.dart';

import 'detail.services.dart';

class DetailController extends GetxController {
  final DetailServices detailServices = DetailServices();

  String? id = Get.parameters['id'];
  String? name = Get.parameters['name'];

  var isLoading = RxBool(false);

  @override
  void onReady() async {
    try {
      isLoading.value = true;

      if (id == null || int.tryParse(id!) == null) {
        throw Exception('Verifica el ID del pokemon por favor');
      }

      if (name == null) {
        throw Exception('Verifica el Name del pokemon por favor');
      }

      await getPokemonInformation(name: name!, id: int.parse(id!));

      super.onReady();
    } catch (e) {
      isLoading.value = false;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getPokemonInformation({
    required String name,
    required int id,
  }) async {
    await detailServices.getPokemonInformation(name);
    await detailServices.getPokemonSpecieInformation(id);
    await detailServices.getPokemonEvolution(id);
  }
}
