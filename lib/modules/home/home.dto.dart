class HomeDTO {
  int count;
  String next;
  String? previous;
  List<ResultsDTO> results;

  HomeDTO({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory HomeDTO.fromJson(Map<String, dynamic> json) {
    List<ResultsDTO> resultsDTO = [];
    List info = json['results'];

    resultsDTO = info.map((value) => ResultsDTO.fromJson(value)).toList();

    return HomeDTO(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: resultsDTO,
    );
  }
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
        types: json["types"].map((type) => TypesDTO.fromJson(type)).toList(),
      );
}

class TypesDTO {
  int slot;
  List<TypeDTO> type;

  TypesDTO({
    required this.slot,
    required this.type,
  });

  factory TypesDTO.fromJson(Map<String, dynamic> json) => TypesDTO(
        slot: json["slot"],
        type: json["type"].map((type) => TypeDTO.fromJson(type)).toList(),
      );
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
}
