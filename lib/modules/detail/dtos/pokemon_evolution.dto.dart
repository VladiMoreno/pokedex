class PokemonEvolutionDTO {
  int id;
  ChainDetailDTO chain;

  PokemonEvolutionDTO({
    required this.id,
    required this.chain,
  });

  factory PokemonEvolutionDTO.fromJson(Map<String, dynamic> json) =>
      PokemonEvolutionDTO(
        id: json["id"],
        chain: ChainDetailDTO.fromJson(json['chain']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chain": chain.toJson(),
      };
}

class ChainDetailDTO {
  SpeciesDto species;
  List<EvolvesToDTO> evolvesTo;

  ChainDetailDTO({
    required this.species,
    required this.evolvesTo,
  });

  factory ChainDetailDTO.fromJson(Map<String, dynamic> json) => ChainDetailDTO(
        species: SpeciesDto.fromJson(json["species"]),
        evolvesTo: json['evolves_to']
            .map((value) => EvolvesToDTO.fromJson(value))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "species": species.toJson(),
        "evolvesTo": evolvesTo.map((e) => e.toJson()).toList(),
      };
}

class SpeciesDto {
  String name;

  SpeciesDto({required this.name});

  factory SpeciesDto.fromJson(Map<String, dynamic> json) => SpeciesDto(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class EvolvesToDTO {
  SpeciesDto species;
  List<EvolutionDetails> evolutionDetails;
  List<EvolvesToDTO> evolvesTo;

  EvolvesToDTO({
    required this.species,
    required this.evolutionDetails,
    required this.evolvesTo,
  });

  factory EvolvesToDTO.fromJson(Map<String, dynamic> json) => EvolvesToDTO(
        species: SpeciesDto.fromJson(json["species"]),
        evolutionDetails: json["evolution_details"]
            .map((value) => EvolutionDetails.fromJson(value))
            .toList(),
        evolvesTo: json['evolves_to']
            .map((value) => EvolvesToDTO.fromJson(value))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "species": species,
        "evolutionDetails": evolutionDetails.map((e) => e.toJson()).toList(),
        "evolvesTo": evolvesTo.map((e) => e.toJson()).toList(),
      };
}

class EvolutionDetails {
  int minLevel;

  EvolutionDetails({
    required this.minLevel,
  });

  factory EvolutionDetails.fromJson(Map<String, dynamic> json) =>
      EvolutionDetails(
        minLevel: json["min_level"],
      );

  Map<String, dynamic> toJson() => {
        "minLevel": minLevel,
      };
}
