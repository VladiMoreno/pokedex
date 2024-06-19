class HomeDTO {
  int count;
  String next;
  String? previous;
  List<GeneralDTO> results;

  HomeDTO({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory HomeDTO.fromJson(Map json) {
    List<GeneralDTO> generalDTO = [];
    List info = json['results'];

    generalDTO = info.map((value) => GeneralDTO.fromJson(value)).toList();

    return HomeDTO(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: generalDTO,
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results.map((e) => e.toJson()).toList(),
      };
}

class GeneralDTO {
  String name;
  String url;

  GeneralDTO({
    required this.name,
    required this.url,
  });

  factory GeneralDTO.fromJson(Map<String, dynamic> json) => GeneralDTO(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class ResultsDTO {
  int id;
  String name;
  List<TypesDTO> types;

  ResultsDTO({
    required this.id,
    required this.name,
    required this.types,
  });

  factory ResultsDTO.fromJson(Map<String, dynamic> json) => ResultsDTO(
        id: json["id"],
        name: json["name"],
        types: (json["types"] as List)
            .map((type) => TypesDTO.fromJson(type))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "types": types.map((e) => e.toJson()).toList(),
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
