class Charactor {
  final String name;
  final String image;
  final String role;
  final String link;

  Charactor(
      {required this.name,
      required this.image,
      required this.role,
      required this.link});

  Map<String, dynamic> toMap() {
    return {
      'charactorName': name,
      'charactorImage': image,
      'charactorRole': role,
      'charactorLink': link,
    };
  }
}
