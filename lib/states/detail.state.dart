import 'package:pokedex/constants/actions_state.constants.dart';

class DetailState {
  bool isInitialized = false;
  Map<String, dynamic> info = {};

  void reset() {
    isInitialized = false;
    info = {};
  }

  void action(option, data) {
    switch (option) {
      case initialize:
        isInitialized = true;
        break;
      case add:
        String id = data["id"].toString();
        info[id] = {};
        info[id]["pokemonInfo"] = data["pokemonInfo"];
        info[id]["pokemonSpecieInfo"] = data["pokemonSpecieInfo"];
        info[id]["pokemonEvolutionInfo"] = data["pokemonEvolutionInfo"];

        break;
    }
  }
}
