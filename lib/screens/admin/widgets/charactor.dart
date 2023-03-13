import 'dart:developer';

import 'package:anime_app/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final controller = Get.find<AdiminController>();
  void _onTextChanged() {
    setState(() {
      controller.showDoneIcon =
          controller.charImageURLController.text.isNotEmpty;
      // controller.isSkillSelected = controller.skillController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    log("${controller.skills}===1==");
    log("${controller.skills}=========");
    // controller.skillController.addListener(_onTextChanged);

    controller.charImageURLController.addListener(_onTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  "Charactor Image".text.white.xl2.make(),
                  10.widthBox,
                  "${controller.currentIndex} added".text.white.size(8).make(),
                ],
              ),
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
                              controller.charImgUrl
                                  .add(controller.charImageURLController.text);
                              controller.currentIndex++;
                              controller.charImageURLController.clear();
                            });
                            print(controller.imgUrl);
                          },
                          child: "Add".text.make(),
                        )
                      : Container(),
                ],
              ),
              10.heightBox,
              adminTextformField(
                  hint: "character Name",
                  controller: controller.charNameController),
              10.heightBox,
              adminTextformField(
                  hint: "character Role",
                  controller: controller.charroleController),
              10.heightBox,
              adminTextformField(
                  hint: "character age",
                  controller: controller.charAgeController),
              10.heightBox,
              adminTextformField(
                  hint: "character affilation",
                  controller: controller.charAffilationController),
              10.heightBox,
              adminTextformField(
                  hint: "character birthdate",
                  controller: controller.charbirthdateController),
              10.heightBox,
              adminTextformField(
                  hint: "character devil fruit",
                  controller: controller.chardevilFruitontroller),
              10.heightBox,
              adminTextformField(
                  hint: "character height",
                  controller: controller.charheightController),
              10.heightBox,
              adminTextformField(
                  hint: "character japname",
                  controller: controller.charjapnameController),
              10.heightBox,
              adminTextformField(
                  hint: "character overView",
                  isDisc: true,
                  controller: controller.charOverviewController),
              10.heightBox,
              adminTextformField(
                  hint: "character position",
                  controller: controller.charPostitionController),
              10.heightBox,
              adminTextformField(
                  hint: "Type", controller: controller.charTypeController),
              10.heightBox,
              adminTextformField(
                  hint: "Zodiac Signe",
                  controller: controller.charZodiacsignController),
              Row(
                children: [
                  'Animeography'.text.white.xl2.make(),
                  const Spacer(),
                  ElevatedButton(
                    style: controller.charactorValidate()
                        ? ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          )
                        : ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                    onPressed: () {
                      if (controller.animeographyValidate()) {
                        controller.addAnimeography();
                        controller.charAnimeographyAnimeImgController.clear();
                        controller.charAnimeographyAnimeNameController.clear();
                        controller.charAnimeographyAnimeTypeController.clear();
                        controller.charAnimeographyAnimeRoleController.clear();
                      } else {
                        VxToast.show(
                          context,
                          msg: 'Please Fill All The Fields',
                          bgColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: 'Add Content'.text.make(),
                  ),
                ],
              ),
              10.heightBox,
              adminTextformField(
                  hint: "Anime Img Url",
                  controller: controller.charAnimeographyAnimeImgController),
              10.heightBox,
              adminTextformField(
                  hint: "Anime Name",
                  controller: controller.charAnimeographyAnimeNameController),
              10.heightBox,
              adminTextformField(
                  hint: "Anime Type",
                  controller: controller.charAnimeographyAnimeTypeController),
              10.heightBox,
              adminTextformField(
                  hint: "Charactore Role",
                  controller: controller.charAnimeographyAnimeRoleController),
              Row(
                children: [
                  'Voice Actors'.text.white.xl2.make(),
                  const Spacer(),
                  ElevatedButton(
                    style: controller.charactorValidate()
                        ? ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          )
                        : ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                    onPressed: () {
                      if (controller.voiceActorsValidate()) {
                        controller.addVoiceActors();

                        controller.charVoiceActorsActorPlaceController.clear();
                        controller.charVoiceActorsActorNameController.clear();
                        controller.charVoiceActorsActorImgController.clear();
                      } else {
                        VxToast.show(
                          context,
                          msg: 'Please Fill All The Fields',
                          bgColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: 'Add Content'.text.make(),
                  ),
                ],
              ),
              10.heightBox,
              adminTextformField(
                  hint: "Actor img Url",
                  controller: controller.charVoiceActorsActorImgController),
              10.heightBox,
              adminTextformField(
                  hint: "Actor Name",
                  controller: controller.charVoiceActorsActorNameController),
              10.heightBox,
              adminTextformField(
                  hint: "Actor Place",
                  controller: controller.charVoiceActorsActorPlaceController),
              20.heightBox,
              GestureDetector(
                onTap: () async {
                  await controller.addCharacters();

                  controller.clickedIndex++;
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: 'Add Character'
                      .text
                      .fontWeight(FontWeight.bold)
                      .makeCentered(),
                ),
              ),
              10.heightBox,
              controller.clickedIndex >= 1
                  ? GestureDetector(
                      onTap: () async {
                        // await FireStoreServices.addAnime(
                        //   AnimeModel(
                        //     animeImg: controller.imgUrl,
                        //     animeName: controller.animeNameController.text,
                        //     actors: controller.actorModel,
                        //     aired: Airing(from: '', to: ''),
                        //     charactorActor: controller.charActor,
                        //     charactors: controller.characters,
                        //     id: '',
                        //     japaneseName:
                        //         controller.animeJapnameController.text,
                        //     overview: controller.animeOverviewController.text,
                        //     popularity: int.parse(
                        //         controller.animePopularityController.text),
                        //     producers: controller.animeProducersController.text,
                        //     rank:
                        //         int.parse(controller.animeRankController.text),
                        //     rating: controller.animeRatingController.text,
                        //     score: double.parse(
                        //         controller.animeScoreController.text),
                        //     status: controller.isAiringSelected
                        //         ? 'Airing'
                        //         : controller.isFinishedSelected
                        //             ? 'Finished'
                        //             : 'Not Yet Aired',
                        //     studio: controller.animeStudiosController.text,
                        //     type: controller.isTvSelected
                        //         ? 'TV'
                        //         : controller.isMovieSelected
                        //             ? 'Movie'
                        //             : 'OVA',
                        //     synonyms: controller.animeSynonymsController.text,
                        //     totalEpisodes:
                        //         controller.animeTotalEpisodesController.text,
                        //   ),
                        // );
                      },
                      child: Container(
                        width: size.width,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: 'Add All'
                            .text
                            .fontWeight(FontWeight.bold)
                            .makeCentered(),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
