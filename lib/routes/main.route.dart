import 'package:get/get.dart';
import 'package:pokedex/modules/detail/detail.view.dart';
import 'package:pokedex/modules/generation/generation.view.dart';
import 'package:pokedex/modules/home/home.view.dart';
import 'package:pokedex/modules/pokemon_generation/pokemon_generation.view.dart';
import 'package:pokedex/modules/type/type.view.dart';

class AppRoutes {
  static const home = '/home';
  static const detail = '/detail';
  static const generation = '/generation';
  static const specificGeneration = '/generation/:id';
  static const type = '/type';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
    GetPage(
      name: detail,
      page: () => DetailView(),
    ),
    GetPage(
      name: generation,
      page: () => GenerationView(),
    ),
    GetPage(
      name: specificGeneration,
      page: () => PokemonGenerationView(),
    ),
    GetPage(
      name: type,
      page: () => TypeView(),
    ),
  ];
}
