import 'package:get/get.dart';
import 'package:pokedex/modules/home/home.view.dart';

class AppRoutes {
  static const home = '/home';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
  ];
}
