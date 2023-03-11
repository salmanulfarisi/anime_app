class CharactorModel {
  final String name;
  final String description;
  final String bounty;
  final String affiletion;
  final String age;
  final String birthdate;
  final String devilfurit;
  final String height;
  final String japName;
  final String position;
  final String role;
  final String type;
  final String zodiac;
  final List<String> image;
  final List<Animeography> animeography;
  final List<VoiceActors> voiceActors;

  CharactorModel({
    required this.name,
    required this.description,
    required this.bounty,
    required this.affiletion,
    required this.age,
    required this.birthdate,
    required this.devilfurit,
    required this.height,
    required this.japName,
    required this.position,
    required this.role,
    required this.type,
    required this.zodiac,
    required this.image,
    required this.animeography,
    required this.voiceActors,
  });

  factory CharactorModel.fromMap(Map<String, dynamic> data) {
    return CharactorModel(
      name: data['name'],
      description: data['description'],
      bounty: data['bounty'],
      affiletion: data['affiletion'],
      age: data['age'],
      birthdate: data['birthdate'],
      devilfurit: data['devilfurit'],
      height: data['height'],
      japName: data['japName'],
      position: data['position'],
      role: data['role'],
      type: data['type'],
      zodiac: data['zodiac'],
      image: List<String>.from(data['image'].map((x) => x)),
      animeography: List<Animeography>.from(
          data['animeography'].map((x) => Animeography.fromMap(x))),
      voiceActors: List<VoiceActors>.from(
          data['voiceActors'].map((x) => VoiceActors.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'over_view': description,
      'Bounty': bounty,
      'affiliation': affiletion,
      'age': age,
      'birthdate': birthdate,
      'devil_fruit': devilfurit,
      'height': height,
      'jap_name': japName,
      'position': position,
      'role': role,
      'type': type,
      'zodiac_sign': zodiac,
      'img': List<dynamic>.from(image.map((x) => x)),
      'animeography': List<dynamic>.from(animeography.map((x) => x.toMap())),
      'voice_actors': List<dynamic>.from(voiceActors.map((x) => x.toMap())),
    };
  }
}

class Animeography {
  final String animeImg;
  final String animeName;
  final String animeRole;
  final String animeType;

  Animeography({
    required this.animeImg,
    required this.animeName,
    required this.animeRole,
    required this.animeType,
  });

  factory Animeography.fromMap(Map<String, dynamic> data) {
    return Animeography(
      animeImg: data['animeImg'],
      animeName: data['animeName'],
      animeRole: data['animeRole'],
      animeType: data['animeType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'animeImg': animeImg,
      'anime_name': animeName,
      'role': animeRole,
      'anime_type': animeType,
    };
  }
}

class VoiceActors {
  final String actorImg;
  final String actorName;
  final String actorPlace;

  VoiceActors({
    required this.actorImg,
    required this.actorName,
    required this.actorPlace,
  });

  factory VoiceActors.fromMap(Map<String, dynamic> data) {
    return VoiceActors(
      actorImg: data['actorImg'],
      actorName: data['actorName'],
      actorPlace: data['actorPlace'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'actorImg': actorImg,
      'actor_name': actorName,
      'place': actorPlace,
    };
  }
}
