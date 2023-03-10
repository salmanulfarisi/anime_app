import 'package:anime_app/models/charactor_actor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdiminController extends GetxController {
  var currentIndex = 0.obs;
  var clickedIndex = 0.obs;

  List<String> imgUrl = [];
  var skills = [].obs;
  var charactorActorModel = <CharactorActorModel>[].obs;

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

  var skillController = TextEditingController();
}
