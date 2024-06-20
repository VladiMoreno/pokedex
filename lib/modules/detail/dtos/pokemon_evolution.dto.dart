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
  int id;
  int minLevel; // New attribute to handle min_level

  SpeciesDto({
    required this.name,
    required this.id,
    this.minLevel = 0, // Default to 0 if not provided
  });

  factory SpeciesDto.fromJson(Map<String, dynamic> json) {
    int lastNumberInt = 0;

    if (json['url'] != null) {
      List<String> parts = json['url'].split('/');
      String? lastNumber = parts.lastWhere(
        (element) => element.isNotEmpty,
        orElse: () => "",
      );
      lastNumberInt = int.parse(lastNumber);
    }

    int minLevel = json['evolution_details'] != null &&
            json['evolution_details'].isNotEmpty &&
            json['evolution_details'][0]['min_level'] != null
        ? json['evolution_details'][0]['min_level']
        : 0; // Default to 0 if min_level is not specified

    return SpeciesDto(
      name: json["name"],
      id: json['id'] ?? lastNumberInt,
      minLevel: minLevel,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "min_level": minLevel,
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

  factory EvolutionDetails.fromJson(Map<String, dynamic> json) {
    return EvolutionDetails(
      minLevel: json["min_level"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "min_level": minLevel,
      };
}
