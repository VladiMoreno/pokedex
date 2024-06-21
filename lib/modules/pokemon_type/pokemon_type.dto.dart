class PokemonTypeDTO {
  int id;
  List<PokemonDTO> pokemon;

  PokemonTypeDTO({
    required this.id,
    required this.pokemon,
  });

  factory PokemonTypeDTO.fromJson(Map<String, dynamic> json) {
    var pokemonList = json['pokemon'] as List;

    List<PokemonDTO> speciesList =
        pokemonList.map((e) => PokemonDTO.fromJson(e)).toList();

    return PokemonTypeDTO(
      id: json['id'],
      pokemon: speciesList,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "pokemon": pokemon.map((e) => e.toJson()).toList(),
      };
}

class PokemonDTO {
  int slot;
  DetailPokemonDTO pokemon;

  PokemonDTO({
    required this.slot,
    required this.pokemon,
  });

  factory PokemonDTO.fromJson(Map<String, dynamic> json) => PokemonDTO(
        slot: json['slot'],
        pokemon: DetailPokemonDTO.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "pokemon": pokemon.toJson(),
      };
}

class DetailPokemonDTO {
  String name;
  String url;

  DetailPokemonDTO({
    required this.name,
    required this.url,
  });

  factory DetailPokemonDTO.fromJson(Map<String, dynamic> json) {
    return DetailPokemonDTO(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
