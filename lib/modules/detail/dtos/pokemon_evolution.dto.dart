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
        evolvesTo: List<EvolvesToDTO>.from((json['evolves_to'] as List)
            .map((value) => EvolvesToDTO.fromJson(value))),
      );

  Map<String, dynamic> toJson() => {
        "species": species.toJson(),
        "evolves_to": evolvesTo.map((e) => e.toJson()).toList(),
      };
}

class SpeciesDto {
  String name;

  SpeciesDto({
    required this.name,
  });

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
        evolutionDetails: List<EvolutionDetails>.from(
            (json["evolution_details"] as List)
                .map((value) => EvolutionDetails.fromJson(value))),
        evolvesTo: List<EvolvesToDTO>.from((json['evolves_to'] as List)
            .map((value) => EvolvesToDTO.fromJson(value))),
      );

  Map<String, dynamic> toJson() => {
        "species": species.toJson(),
        "evolution_details": evolutionDetails.map((e) => e.toJson()).toList(),
        "evolves_to": evolvesTo.map((e) => e.toJson()).toList(),
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
        "min_level": minLevel,
      };
}
