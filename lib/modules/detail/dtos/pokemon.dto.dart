class PokemonInformation {
  int id;
  String name;
  int weight;
  int height;
  int baseExperience;
  List<StatsInfo> stats;
  List<TypesDTO> types;
  List<AbilitiesDTO> abilities;

  PokemonInformation({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.baseExperience,
    required this.stats,
    required this.types,
    required this.abilities,
  });

  factory PokemonInformation.fromJson(Map<String, dynamic> json) =>
      PokemonInformation(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        height: json["height"],
        baseExperience: json["base_experience"],
        stats: List<StatsInfo>.from(
            json['stats'].map((stat) => StatsInfo.fromJson(stat))),
        types: List<TypesDTO>.from(
            json['types'].map((stat) => TypesDTO.fromJson(stat))),
        abilities: List<AbilitiesDTO>.from(json['abilities']
            .map((abilitie) => AbilitiesDTO.fromJson(abilitie))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "weight": weight,
        "height": height,
        "base_experience": baseExperience,
        "stats": stats.map((e) => e.toJson()).toList(),
        "types": types.map((e) => e.toJson()).toList(),
        "abilities": abilities.map((e) => e.toJson()).toList(),
      };
}

class StatsInfo {
  int baseStat;
  DetailStat stat;

  StatsInfo({
    required this.baseStat,
    required this.stat,
  });

  factory StatsInfo.fromJson(Map<String, dynamic> json) => StatsInfo(
        baseStat: json["base_stat"],
        stat: DetailStat.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": stat.toJson(),
      };
}

class DetailStat {
  String name;

  DetailStat({required this.name});

  factory DetailStat.fromJson(Map<String, dynamic> json) => DetailStat(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class SpritesInfo {
  String frontDefault;
  String frontShiny;

  SpritesInfo({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory SpritesInfo.fromJson(Map<String, dynamic> json) => SpritesInfo(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class OtherSprites {
  Showdown sprites;

  OtherSprites({required this.sprites});

  factory OtherSprites.fromJson(Map<String, dynamic> json) => OtherSprites(
        sprites: Showdown.fromJson(json["sprites"]),
      );

  Map<String, dynamic> toJson() => {
        "sprites": sprites,
      };
}

class Showdown {
  String frontDefault;
  String frontShiny;

  Showdown({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory Showdown.fromJson(Map<String, dynamic> json) => Showdown(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class TypesDTO {
  int slot;
  TypeDTO type;

  TypesDTO({
    required this.slot,
    required this.type,
  });

  factory TypesDTO.fromJson(Map<String, dynamic> json) => TypesDTO(
        slot: json["slot"],
        type: TypeDTO.fromJson(json['type']),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class TypeDTO {
  String name;
  String url;

  TypeDTO({
    required this.name,
    required this.url,
  });

  factory TypeDTO.fromJson(Map<String, dynamic> json) => TypeDTO(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class AbilitiesDTO {
  int slot;
  DetailAbilitiesDTO ability;

  AbilitiesDTO({
    required this.slot,
    required this.ability,
  });

  factory AbilitiesDTO.fromJson(Map<String, dynamic> json) => AbilitiesDTO(
        slot: json["slot"],
        ability: DetailAbilitiesDTO.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "ability": ability.toJson(),
      };
}

class DetailAbilitiesDTO {
  String name;
  String url;

  DetailAbilitiesDTO({
    required this.name,
    required this.url,
  });

  factory DetailAbilitiesDTO.fromJson(Map<String, dynamic> json) =>
      DetailAbilitiesDTO(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
