class Actors {
  final String actorImage;
  final String actorName;
  final String actorPlace;
  final String birthName;
  final String birthPlace;
  final String profile;
  final List<ActingRoles> actingRoles;
  final List<String> skillability;

  Actors({
    required this.actorImage,
    required this.actorName,
    required this.actorPlace,
    required this.birthName,
    required this.birthPlace,
    required this.profile,
    required this.actingRoles,
    required this.skillability,
  });

  factory Actors.fromMap(Map<String, dynamic> data) {
    return Actors(
      actorImage: data['actorImage'],
      actorName: data['actorName'],
      actorPlace: data['actorPlace'],
      birthName: data['birthName'],
      birthPlace: data['birthPlace'],
      profile: data['profile'],
      actingRoles: List<ActingRoles>.from(
          data['actingRoles'].map((x) => ActingRoles.fromMap(x))),
      skillability: List<String>.from(data['skillability']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Img': actorImage,
      'name': actorName,
      'place': actorPlace,
      'birth_name': birthName,
      'birth_place': birthPlace,
      'profile': profile,
      'acting_roles': actingRoles.map((x) => x.toMap()).toList(),
      'skill_abilities': skillability,
    };
  }
}

class ActingRoles {
  final String charImage;
  final String charName;
  final String charRole;
  final String animeImg;
  final String animeName;
  final String animeType;
  final String animeYear;

  ActingRoles({
    required this.charImage,
    required this.charName,
    required this.charRole,
    required this.animeImg,
    required this.animeName,
    required this.animeType,
    required this.animeYear,
  });

  factory ActingRoles.fromMap(Map<String, dynamic> data) {
    return ActingRoles(
      charImage: data['charImage'],
      charName: data['charName'],
      charRole: data['charRole'],
      animeImg: data['animeImg'],
      animeName: data['animeName'],
      animeType: data['animeType'],
      animeYear: data['animeYear'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'charImg': charImage,
      'char_name': charName,
      'char_role': charRole,
      'animeImg': animeImg,
      'animeName': animeName,
      'anime_type': animeType,
      'anime_year': animeYear,
    };
  }
}
