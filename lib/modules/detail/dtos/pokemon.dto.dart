class PokemonInformation {
  int id;
  String name;
  int weight;
  int baseExperience;
  List<StatsInfo> stats;

  PokemonInformation({
    required this.id,
    required this.name,
    required this.weight,
    required this.baseExperience,
    required this.stats,
  });

  factory PokemonInformation.fromJson(Map<String, dynamic> json) =>
      PokemonInformation(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        baseExperience: json["base_experience"],
        stats: List<StatsInfo>.from(
            json['stats'].map((stat) => StatsInfo.fromJson(stat))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "weight": weight,
        "stats": stats.map((e) => e.toJson()).toList(),
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
        "baseStat": baseStat,
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
        "frontDefault": frontDefault,
        "frontShiny": frontShiny,
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
        "frontDefault": frontDefault,
        "frontShiny": frontShiny,
      };
}
