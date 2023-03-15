class Charactor {
  final String name;
  final String image;

  Charactor({required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return {
      'charactorName': name,
      'charactorImage': image,
    };
  }
}
