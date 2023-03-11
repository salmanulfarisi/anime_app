import 'package:anime_app/models/actors_model.dart';
import 'package:anime_app/models/charactor_actor_model.dart';
import 'package:anime_app/models/charactor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdiminController extends GetxController {
  var currentIndex = 0.obs;
  var clickedIndex = 0.obs;

  List<String> imgUrl = [];
  List<String> charImgUrl = [];
  List<String> skills = [];
  List<CharactorActorModel> charActor = [];
  var actorModel = <Actors>[].obs;
  List<Animeography> animeography = [];
  List<VoiceActors> voiceActingRole = [];
  List<CharactorModel> characters = [];

  bool isTvSelected = false;
  bool isMovieSelected = false;
  bool isFinishedSelected = false;
  bool isAiringSelected = false;
  bool isNotYetSelected = false;
  bool showDoneIcon = false;
  bool isSkillSelected = false;

  // All detail textEditingController
  var animeImageUrlController = TextEditingController();
  var animeNameController = TextEditingController();
  var animeJapnameController = TextEditingController();
  var animeOverviewController = TextEditingController();
  var animePopularityController = TextEditingController();
  var animeRankController = TextEditingController();
  var animeRatingController = TextEditingController();
  var animeScoreController = TextEditingController();
  var animeTotalEpisodesController = TextEditingController();
  var animeSynonymsController = TextEditingController();
  var animeStudiosController = TextEditingController();
  var animeProducersController = TextEditingController();

// character& actor textEditingController
  var characterImageUrlController = TextEditingController();
  var charnameController = TextEditingController();
  var charRoleController = TextEditingController();
  var actImageUrlController = TextEditingController();
  var actNameController = TextEditingController();
  var actPlaceController = TextEditingController();

  // validate character and actor
  charactorValidate() {
    if (characterImageUrlController.text.isNotEmpty &&
        charnameController.text.isNotEmpty &&
        charRoleController.text.isNotEmpty &&
        actImageUrlController.text.isNotEmpty &&
        actNameController.text.isNotEmpty &&
        actPlaceController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // add character and actor
  addCharactorActor() {
    if (charactorValidate()) {
      charActor.add(CharactorActorModel(
        charImage: characterImageUrlController.text,
        charName: charnameController.text,
        charRole: charRoleController.text,
        actorImage: actImageUrlController.text,
        actorName: actNameController.text,
        actorPlace: actPlaceController.text,
      ));
      characterImageUrlController.clear();
      charnameController.clear();
      charRoleController.clear();
      actImageUrlController.clear();
      actNameController.clear();
      actPlaceController.clear();
    }
  }

// actor detail textEditingController
  var actorSkillController = TextEditingController();
  var actorNameController = TextEditingController();
  var actorImageController = TextEditingController();
  var actorPlaceController = TextEditingController();
  var actorPRofileController = TextEditingController();
  var actorBloodTypeController = TextEditingController();
  var actorBirthplaceController = TextEditingController();
  var actorbirthNameController = TextEditingController();

  actorValidate() {
    if (actorImageController.text.isNotEmpty &&
        actorNameController.text.isNotEmpty &&
        actorPlaceController.text.isNotEmpty &&
        actorPRofileController.text.isNotEmpty &&
        actorBloodTypeController.text.isNotEmpty &&
        actorBirthplaceController.text.isNotEmpty &&
        actorbirthNameController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  addActor() {
    if (actorValidate()) {
      actorModel.add(Actors(
        actorImage: actorImageController.text,
        actorName: actorNameController.text,
        actorPlace: actorPlaceController.text,
        birthName: actorbirthNameController.text,
        birthPlace: actorBirthplaceController.text,
        profile: actorPRofileController.text,
        bloodType: actorBloodTypeController.text,
        skillability: skills,
        actingRoles: [],
      ));
      actorImageController.clear();
      actorNameController.clear();
      actorPlaceController.clear();
      actorPRofileController.clear();
      actorBloodTypeController.clear();
      actorBirthplaceController.clear();
      actorbirthNameController.clear();
    }
  }

  // characters textform controller
  var charBountyController = TextEditingController();
  var charAffilationController = TextEditingController();
  var charAgeController = TextEditingController();
  var charbirthdateController = TextEditingController();
  var chardevilFruitontroller = TextEditingController();
  var charheightController = TextEditingController();
  var charjapnameController = TextEditingController();
  var charNameController = TextEditingController();
  var charOverviewController = TextEditingController();
  var charPostitionController = TextEditingController();
  var charroleController = TextEditingController();
  var charTypeController = TextEditingController();
  var charZodiacsignController = TextEditingController();
  var charImageURLController = TextEditingController();

  // characters animeography controller
  var charAnimeographyAnimeImgController = TextEditingController();
  var charAnimeographyAnimeNameController = TextEditingController();
  var charAnimeographyAnimeRoleController = TextEditingController();
  var charAnimeographyAnimeTypeController = TextEditingController();

  // characters Voice actors controller
  var charVoiceActorsActorImgController = TextEditingController();
  var charVoiceActorsActorNameController = TextEditingController();
  var charVoiceActorsActorPlaceController = TextEditingController();

  // validate animeography
  animeographyValidate() {
    if (charAnimeographyAnimeImgController.text.isNotEmpty &&
        charAnimeographyAnimeNameController.text.isNotEmpty &&
        charAnimeographyAnimeRoleController.text.isNotEmpty &&
        charAnimeographyAnimeTypeController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // validate voiceactors
  voiceActorsValidate() {
    if (charVoiceActorsActorImgController.text.isNotEmpty &&
        charVoiceActorsActorNameController.text.isNotEmpty &&
        charVoiceActorsActorPlaceController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // add characters image url
  addCharacterImageUrl() {
    if (characterImageUrlController.text.isNotEmpty) {
      charImgUrl.add(characterImageUrlController.text);
      characterImageUrlController.clear();
    }
  }

  // add voice actors
  addVoiceActors() {
    if (voiceActorsValidate()) {
      voiceActingRole.add(VoiceActors(
        actorName: charVoiceActorsActorNameController.text,
        actorPlace: charVoiceActorsActorPlaceController.text,
        actorImg: charVoiceActorsActorImgController.text,
      ));
      charVoiceActorsActorImgController.clear();
      charVoiceActorsActorNameController.clear();
      charVoiceActorsActorPlaceController.clear();
    }
  }

  // add animeography
  addAnimeography() {
    if (animeographyValidate()) {
      animeography.add(Animeography(
        animeName: charAnimeographyAnimeNameController.text,
        animeRole: charAnimeographyAnimeRoleController.text,
        animeType: charAnimeographyAnimeTypeController.text,
        animeImg: charAnimeographyAnimeImgController.text,
      ));
      charAnimeographyAnimeImgController.clear();
      charAnimeographyAnimeNameController.clear();
      charAnimeographyAnimeRoleController.clear();
      charAnimeographyAnimeTypeController.clear();
    }
  }

  // add characters
  addCharacters() {
    if (charactorValidate()) {
      characters.add(CharactorModel(
        name: charNameController.text,
        description: charOverviewController.text,
        bounty: charBountyController.text,
        affiletion: charAffilationController.text,
        age: charAgeController.text,
        birthdate: charbirthdateController.text,
        devilfurit: chardevilFruitontroller.text,
        height: charheightController.text,
        japName: charjapnameController.text,
        position: charPostitionController.text,
        role: charroleController.text,
        type: charTypeController.text,
        zodiac: charZodiacsignController.text,
        image: charImgUrl,
        animeography: animeography,
        voiceActors: voiceActingRole,
      ));
      characterImageUrlController.clear();
      charnameController.clear();
      charRoleController.clear();
      actImageUrlController.clear();
      actNameController.clear();
      actPlaceController.clear();
      charBountyController.clear();
      charAffilationController.clear();
      charAgeController.clear();
      charbirthdateController.clear();
      chardevilFruitontroller.clear();
      charheightController.clear();
      charjapnameController.clear();
      charNameController.clear();
      charOverviewController.clear();
      charPostitionController.clear();
      charroleController.clear();
      charTypeController.clear();
      charZodiacsignController.clear();
      animeography.clear();
      voiceActingRole.clear();
    }
  }
}
