class TypeDTO {
  String name;
  String url;

  TypeDTO({
    required this.name,
    required this.url,
  });

  factory TypeDTO.fromJson(Map<String, dynamic> json) => TypeDTO(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
