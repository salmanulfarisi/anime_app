import 'package:anime_app/controller/admin_controller.dart';
import 'package:anime_app/models/anime_model.dart';
import 'package:anime_app/screens/admin/actors.dart';
import 'package:anime_app/screens/admin/widgets/charactor.dart';
import 'package:anime_app/screens/admin/widgets/widgets.dart';
import 'package:anime_app/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class AdMinPanel extends StatefulWidget {
  const AdMinPanel({Key? key}) : super(key: key);

  @override
  State<AdMinPanel> createState() => _AdMinPanelState();
}

class _AdMinPanelState extends State<AdMinPanel> {
  final controller = Get.put(AdiminController());
  // int _currentIndex = 0;

  // List<String> imgUrl = [];
  // List<String> skills = [];
  // List<CharactorActorModel> charactorActorModel = [];

  // // bool
  // bool isTvSelected = false;
  // bool isMovieSelected = false;
  // bool isFinishedSelected = false;
  // bool isAiringSelected = false;
  // bool isNotYetSelected = false;
  // bool _showDoneIcon = false;
  // bool isSkillSelected = false;

  // // textEditingController
  // var animeImageUrlController = TextEditingController();
  // var characterImageUrlController = TextEditingController();
  // var charnameController = TextEditingController();
  // var charRoleController = TextEditingController();
  // var actImageUrlController = TextEditingController();
  // var actNameController = TextEditingController();
  // var actPlaceController = TextEditingController();

  // var skillController = TextEditingController();

  void _onTextChanged() {
    setState(() {
      controller.showDoneIcon =
          controller.animeImageUrlController.text.isNotEmpty;
      controller.isSkillSelected = controller.skillController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    print(controller.imgUrl);
    controller.skillController.addListener(_onTextChanged);

    controller.animeImageUrlController.addListener(_onTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  "Anime Image".text.white.xl2.make(),
                  10.widthBox,
                  "${controller.currentIndex} added".text.white.size(8).make(),
                ],
              ),
              10.heightBox,
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: urlTextField(
                        controller: controller.animeImageUrlController),
                  ),
                  10.widthBox,
                  controller.showDoneIcon
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              controller.imgUrl
                                  .add(controller.animeImageUrlController.text);
                              controller.currentIndex++;
                              controller.animeImageUrlController.clear();
                            });
                            print(controller.imgUrl);
                          },
                          child: "Add".text.make(),
                        )
                      : Container(),
                ],
              ),
              10.heightBox,
              "AnimeTitle".text.white.xl2.make(),
              10.heightBox,
              adminTextformField(
                  hint: "AnimeTitle",
                  controller: controller.animeNameController),
              10.heightBox,
              "Japanese name".text.white.xl2.make(),
              10.heightBox,
              adminTextformField(
                  hint: "Japanese Name",
                  controller: controller.animeJapnameController),
              10.heightBox,
              "AnimeType".text.white.xl2.make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  animeType(
                    context: context,
                    onpress: () {
                      setState(() {
                        controller.isTvSelected = !controller.isTvSelected;
                      });
                    },
                    icon: LineIcons.television,
                    label: "Tv",
                    isSelected: controller.isTvSelected,
                  ),
                  animeType(
                    context: context,
                    onpress: () {
                      setState(() {
                        controller.isMovieSelected =
                            !controller.isMovieSelected;
                      });
                    },
                    icon: LineIcons.theaterMasks,
                    label: "Movie",
                    isSelected: controller.isMovieSelected,
                  ),
                ],
              ),
              10.heightBox,
              "OverView".text.white.xl2.make(),
              10.heightBox,
              adminTextformField(
                  hint: "Anime Disc",
                  isDisc: true,
                  controller: controller.animeOverviewController),
              10.heightBox,
              Wrap(
                spacing: 10,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      'Popularity'.text.white.make(),
                      10.heightBox,
                      SizedBox(
                        width: size.width * 0.2,
                        child: adminTextformField(
                            hint: 'popularity',
                            keyboardType: TextInputType.number,
                            controller: controller.animePopularityController),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      'Rank'.text.white.make(),
                      10.heightBox,
                      SizedBox(
                        width: size.width * 0.2,
                        child: adminTextformField(
                            hint: 'rank',
                            keyboardType: TextInputType.number,
                            controller: controller.animeRankController),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      'Score'.text.white.make(),
                      10.heightBox,
                      SizedBox(
                        width: size.width * 0.2,
                        child: adminTextformField(
                            hint: 'score',
                            keyboardType: TextInputType.number,
                            controller: controller.animeScoreController),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      'total Episodes'.text.white.make(),
                      10.heightBox,
                      SizedBox(
                        width: size.width * 0.2,
                        child: adminTextformField(
                            hint: 'episodes',
                            controller:
                                controller.animeTotalEpisodesController),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      'Rating'.text.white.make(),
                      10.heightBox,
                      SizedBox(
                        width: size.width * 0.2,
                        child: adminTextformField(
                            hint: 'rating',
                            controller: controller.animeRatingController),
                      ),
                    ],
                  ),
                ],
              ),
              10.heightBox,
              "synonyms".text.white.xl2.make(),
              10.heightBox,
              adminTextformField(
                  hint: "synonyms",
                  controller: controller.animeSynonymsController),
              10.heightBox,
              "Studios".text.white.xl2.make(),
              10.heightBox,
              adminTextformField(
                  hint: "Studios",
                  controller: controller.animeStudiosController),
              10.heightBox,
              "producers".text.white.xl2.make(),
              10.heightBox,
              adminTextformField(
                  hint: "Producers",
                  controller: controller.animeProducersController),
              10.heightBox,
              "Aired".text.white.xl2.make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectButton(
                    context: context,
                    text: 'Airing',
                    isSelect: controller.isAiringSelected,
                    borderColor: Colors.white,
                    ontap: () {
                      if (controller.isFinishedSelected == true ||
                          controller.isNotYetSelected == true) {
                      } else {
                        setState(() {
                          controller.isAiringSelected =
                              !controller.isAiringSelected;
                        });
                      }
                    },
                  ),
                  selectButton(
                    context: context,
                    text: 'Finished',
                    isSelect: controller.isFinishedSelected,
                    borderColor: Colors.green,
                    ontap: () {
                      if (controller.isAiringSelected == true ||
                          controller.isNotYetSelected == true) {
                      } else {
                        setState(() {
                          controller.isFinishedSelected =
                              !controller.isFinishedSelected;
                        });
                      }
                    },
                  ),
                  selectButton(
                    context: context,
                    text: 'Not Aired',
                    isSelect: controller.isNotYetSelected,
                    borderColor: Colors.white,
                    ontap: () {
                      if (controller.isFinishedSelected == true ||
                          controller.isAiringSelected == true) {
                      } else {
                        setState(() {
                          controller.isNotYetSelected =
                              !controller.isNotYetSelected;
                        });
                      }
                    },
                  ),
                ],
              ),
              10.heightBox,
              'Characters & Actors'.text.white.xl2.make(),
              10.heightBox,
              adminTextformField(
                  hint: "character Image Url",
                  controller: controller.characterImageUrlController),
              10.heightBox,
              adminTextformField(
                  hint: "character Name",
                  controller: controller.charnameController),
              10.heightBox,
              adminTextformField(
                  hint: "character Role",
                  controller: controller.charRoleController),
              10.heightBox,
              adminTextformField(
                  hint: "Actor Image Url",
                  controller: controller.actImageUrlController),
              10.heightBox,
              adminTextformField(
                  hint: "Actor Name", controller: controller.actNameController),
              10.heightBox,
              adminTextformField(
                  hint: "Actor Place",
                  controller: controller.actPlaceController),
              10.heightBox,
              ElevatedButton(
                onPressed: () async {
                  await FireStoreServices.addAnime(
                    AnimeModel(
                      animeImg: controller.imgUrl,
                      animeName: controller.animeNameController.text,
                      actors: [],
                      aired: Airing(from: '', to: ''),
                      charactorActor: [],
                      charactors: [],
                      id: '',
                      japaneseName: controller.animeJapnameController.text,
                      overview: controller.animeOverviewController.text,
                      popularity:
                          int.parse(controller.animePopularityController.text),
                      producers: controller.animeProducersController.text,
                      rank: int.parse(controller.animeRankController.text),
                      rating: controller.animeRatingController.text,
                      score: double.parse(controller.animeScoreController.text),
                      status: controller.isAiringSelected
                          ? 'Airing'
                          : controller.isFinishedSelected
                              ? 'Finished'
                              : 'Not Yet Aired',
                      studio: controller.animeStudiosController.text,
                      type: controller.isTvSelected
                          ? 'TV'
                          : controller.isMovieSelected
                              ? 'Movie'
                              : 'OVA',
                      synonyms: controller.animeSynonymsController.text,
                      totalEpisodes:
                          controller.animeTotalEpisodesController.text,
                    ),
                  );
                },
                child: "Add".text.make(),
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  addContainer(ontap: () {
                    Get.to(() => const ActorsPage());
                  }),
                  addContainer(
                      text: 'Add Actor',
                      ontap: () {
                        Get.to(() => const CharacterPage());
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
