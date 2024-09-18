class Pais {
  final String name;
  final String languages;
  final String region;
  final String imagesUrl;

  Pais({
    required this.name,
    required this.languages,
    required this.region,
    required this.imagesUrl,
  });

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
      name: json['name'],
      languages: json['languages'],
      region: json['region'],
      imagesUrl: json['images'],
    );
  }
}