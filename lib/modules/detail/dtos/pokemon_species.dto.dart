class PokemonSpeciesDTO {
  int baseHappiness;
  int captureRate;
  EvolutionChain evolutionChain;
  List<EggGroupsDTO> eggGroups;
  GenerationDTO generation;
  GrowthRateDTO growthRate;
  HabitatDTO habitat;

  PokemonSpeciesDTO({
    required this.baseHappiness,
    required this.captureRate,
    required this.evolutionChain,
    required this.eggGroups,
    required this.generation,
    required this.growthRate,
    required this.habitat,
  });

  factory PokemonSpeciesDTO.fromJson(Map<String, dynamic> json) =>
      PokemonSpeciesDTO(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        evolutionChain: EvolutionChain.fromJson(json['evolution_chain']),
        eggGroups: List<EggGroupsDTO>.from(
            json["egg_groups"].map((value) => EggGroupsDTO.fromJson(value))),
        generation: GenerationDTO.fromJson(json["generation"]),
        growthRate: GrowthRateDTO.fromJson(
          json["growth_rate"] ?? json["growthRate"],
        ),
        habitat: HabitatDTO.fromJson(json["habitat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "evolution_chain": evolutionChain.toJson(),
        "egg_groups": eggGroups.map((e) => e.toJson()).toList(),
        "generation": generation.toJson(),
        "growth_rate": growthRate.toJson(),
        "habitat": habitat.toJson(),
      };
}

class EggGroupsDTO {
  String name;

  EggGroupsDTO({required this.name});

  factory EggGroupsDTO.fromJson(Map<String, dynamic> json) => EggGroupsDTO(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class GenerationDTO {
  String name;

  GenerationDTO({required this.name});

  factory GenerationDTO.fromJson(Map<String, dynamic> json) => GenerationDTO(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class GrowthRateDTO {
  String name;

  GrowthRateDTO({required this.name});

  factory GrowthRateDTO.fromJson(Map<String, dynamic> json) => GrowthRateDTO(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class HabitatDTO {
  String name;

  HabitatDTO({required this.name});

  factory HabitatDTO.fromJson(Map<String, dynamic> json) => HabitatDTO(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class EvolutionChain {
  String url;

  EvolutionChain({required this.url});

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
