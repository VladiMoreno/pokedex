class PokemonSpeciesDTO {
  int baseHappiness;
  int captureRate;
  List<EggGroupsDTO> eggGroups;
  GenerationDTO generation;
  GrowthRateDTO growthRate;
  HabitatDTO habitat;

  PokemonSpeciesDTO({
    required this.baseHappiness,
    required this.captureRate,
    required this.eggGroups,
    required this.generation,
    required this.growthRate,
    required this.habitat,
  });

  factory PokemonSpeciesDTO.fromJson(Map<String, dynamic> json) =>
      PokemonSpeciesDTO(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        eggGroups: List<EggGroupsDTO>.from(
            json["egg_groups"].map((value) => EggGroupsDTO.fromJson(value))),
        generation: GenerationDTO.fromJson(json["generation"]),
        growthRate: GrowthRateDTO.fromJson(json["growth_rate"]),
        habitat: HabitatDTO.fromJson(json["habitat"]),
      );

  Map<String, dynamic> toJson() => {
        "baseHappiness": baseHappiness,
        "captureRate": captureRate,
        "eggGroups": eggGroups.map((e) => e.toJson()).toList(),
        "generation": generation.toJson(),
        "growthRate": growthRate.toJson(),
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
