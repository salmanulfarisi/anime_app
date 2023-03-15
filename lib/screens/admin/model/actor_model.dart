class Actor {
  final String name;
  final String image;
  final String link;

  Actor({required this.name, required this.image, required this.link});

  Map<String, dynamic> toMap() {
    return {
      'actorName': name,
      'actorImage': image,
      'actorLink': link,
    };
  }
}
