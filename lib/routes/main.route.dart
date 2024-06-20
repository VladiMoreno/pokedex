import 'package:get/get.dart';
import 'package:pokedex/modules/detail/detail.view.dart';
import 'package:pokedex/modules/home/home.view.dart';

class AppRoutes {
  static const home = '/home';
  static const detail = '/detail';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
    GetPage(
      name: detail,
      page: () => DetailView(),
    ),
  ];
}
