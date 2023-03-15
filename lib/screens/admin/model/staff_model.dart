class Staff {
  final String name;
  final String image;
  final String position;
  final String link;

  Staff({
    required this.name,
    required this.image,
    required this.position,
    required this.link,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      name: json['name'],
      image: json['image'],
      position: json['position'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'position': position,
      'link': link,
    };
  }
}
