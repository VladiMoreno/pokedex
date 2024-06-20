class GenerationDto {
  int id;
  List<PokemonSpeciesDto> pokemonSpecies;

  GenerationDto({
    required this.id,
    required this.pokemonSpecies,
  });

  factory GenerationDto.fromJson(Map<String, dynamic> json) {
    var pokemonSpeciesList = json['pokemon_species'] as List;
    List<PokemonSpeciesDto> speciesList =
        pokemonSpeciesList.map((e) => PokemonSpeciesDto.fromJson(e)).toList();

    return GenerationDto(
      id: json['id'],
      pokemonSpecies: speciesList,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "pokemon_species": pokemonSpecies.map((e) => e.toJson()).toList(),
      };
}

class PokemonSpeciesDto {
  String name;
  String url;

  PokemonSpeciesDto({
    required this.name,
    required this.url,
  });

  factory PokemonSpeciesDto.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesDto(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
