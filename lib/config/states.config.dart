import 'package:get_it/get_it.dart';
import 'package:pokedex/states/detail.state.dart';
import 'package:pokedex/states/home.state.dart';
import 'package:pokedex/states/pokemon_generation.state.dart';

class AppStates {
  final GetIt locator = GetIt.instance;
  static final AppStates _instance = AppStates._internal();

  factory AppStates() {
    return _instance;
  }

  AppStates._internal();

  init() {
    locator.registerSingleton<HomeState>(HomeState());
    locator.registerSingleton<DetailState>(DetailState());
    locator.registerSingleton<PokemonGenerationState>(PokemonGenerationState());
  }

  reset() {
    homeState.reset();
    detailState.reset();
    pokemonGenerationState.reset();
  }

  HomeState get homeState => locator<HomeState>();
  DetailState get detailState => locator<DetailState>();
  PokemonGenerationState get pokemonGenerationState =>
      locator<PokemonGenerationState>();
}
