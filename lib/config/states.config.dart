import 'package:get_it/get_it.dart';
import 'package:pokedex/states/detail.state.dart';
import 'package:pokedex/states/home.state.dart';
import 'package:pokedex/states/pokemon_generation.state.dart';
import 'package:pokedex/states/pokemon_type.state.dart';

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
    locator.registerSingleton<PokemonTypeState>(PokemonTypeState());
  }

  reset() {
    homeState.reset();
    detailState.reset();
    pokemonGenerationState.reset();
    pokemonTypeState.reset();
  }

  HomeState get homeState => locator<HomeState>();
  DetailState get detailState => locator<DetailState>();
  PokemonGenerationState get pokemonGenerationState =>
      locator<PokemonGenerationState>();
  PokemonTypeState get pokemonTypeState => locator<PokemonTypeState>();
}
