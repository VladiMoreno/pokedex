class GenerationDTO {
  final String name;
  final List<ImageDTO> images;

  GenerationDTO({
    required this.name,
    required this.images,
  });

  factory GenerationDTO.fromJson(Map<String, dynamic> json) {
    return GenerationDTO(
      name: json['name'],
      images: List<ImageDTO>.from(
        json['images'].map((image) => ImageDTO.fromJson(image)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'images': images.map((image) => image.toJson()).toList(),
      };
}

class ImageDTO {
  final String url;

  ImageDTO({
    required this.url,
  });

  factory ImageDTO.fromJson(Map<String, dynamic> json) {
    return ImageDTO(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
