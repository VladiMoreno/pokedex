import 'package:pokedex/constants/actions_state.constants.dart';

class PokemonGenerationState {
  bool isInitialized = false;
  Map<String, dynamic> pokemonsGeneralInfo = {};
  Map<String, dynamic> pokemonsInfo = {};
  Map<String, dynamic> paginationInfo = {};

  void reset() {
    isInitialized = false;
    pokemonsGeneralInfo = {};
    pokemonsInfo = {};
    paginationInfo = {};
  }

  void action(option, data) {
    switch (option) {
      case initialize:
        isInitialized = true;
        break;
      case set:
        String id = data["id"].toString();
        if (!pokemonsGeneralInfo.containsKey(id)) {
          pokemonsGeneralInfo[id] = [];
        }
        pokemonsGeneralInfo[id].addAll(data["pokemon_species"]);

        if (!pokemonsInfo.containsKey(id)) {
          pokemonsInfo[id] = [];
        }
        pokemonsInfo[id].addAll(data["pokemons"]);

        if (!paginationInfo.containsKey(id)) {
          paginationInfo[id] = {};
        }

        paginationInfo[id]["page"] = data["page"];
        paginationInfo[id]["initialValue"] = data["initialValue"];

        break;
      case add:
        String id = data["id"].toString();
        pokemonsInfo[id].addAll(data["pokemons"]);
        paginationInfo[id]["page"] = data["page"];
        paginationInfo[id]["initialValue"] = data["initialValue"];
        break;
    }
  }
}
