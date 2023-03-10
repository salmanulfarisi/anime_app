class CharactorActorModel {
  final String charImage;
  final String charName;
  final String charRole;
  final String actorImage;
  final String actorName;
  final String actorPlace;

  CharactorActorModel({
    required this.charImage,
    required this.charName,
    required this.charRole,
    required this.actorImage,
    required this.actorName,
    required this.actorPlace,
  });

  factory CharactorActorModel.fromMap(Map<String, dynamic> data) {
    return CharactorActorModel(
      charImage: data['charImage'],
      charName: data['charName'],
      charRole: data['charRole'],
      actorImage: data['actorImage'],
      actorName: data['actorName'],
      actorPlace: data['actorPlace'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'charImg': charImage,
      'char_name': charName,
      'char_role': charRole,
      'actImg': actorImage,
      'act_name': actorName,
      'act_place': actorPlace,
    };
  }
}
