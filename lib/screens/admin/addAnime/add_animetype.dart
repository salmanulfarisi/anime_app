import 'package:anime_app/screens/admin/addAnime/add_anime.dart';
import 'package:anime_app/screens/admin/addAnime/widgets/custom_textfield.dart';
import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/model/anime_model.dart';
import 'package:anime_app/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddAnimeType extends StatelessWidget {
  const AddAnimeType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Anime Type'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => SwitchListTile(
                    value: controller.isTrending.value,
                    onChanged: (value) {
                      controller.isTrending.value = value;
                    },
                    title: 'isTrending'.text.white.make(),
                  ),
                ),
                10.heightBox,
                Obx(
                  () => Visibility(
                    visible: controller.isTrending.value == true,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        'Trending No'.text.white.make(),
                        10.widthBox,
                        SizedBox(
                          width: context.screenWidth * 0.4,
                          child: customTextField(
                              keyboardtype: TextInputType.number,
                              controller: controller.trendingNoController,
                              hint: 'Trending No',
                              onchanged: (value) {
                                controller.validateTrendingNo(context);
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => SwitchListTile(
                    value: controller.isTopAired.value,
                    onChanged: (value) {
                      controller.isTopAired.value = value;
                    },
                    title: 'is TopAired'.text.white.make(),
                  ),
                ),
                10.heightBox,
                Obx(
                  () => Visibility(
                    visible: controller.isTopAired.value == true,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        'Top Airing No'.text.white.make(),
                        10.widthBox,
                        SizedBox(
                          width: context.screenWidth * 0.4,
                          child: customTextField(
                              keyboardtype: TextInputType.number,
                              controller: controller.topAiredNoController,
                              hint: 'Top Airing No',
                              onchanged: (value) {
                                controller.validateTrendingNo(context);
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                20.heightBox,
                SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () async {
                      await FireStoreServices.addAnimeDetails(
                        AnimeModel(
                          id: FireStoreServices.getNewDocumentId(),
                          animeName: controller.animeNameController.text,
                          animeImage: controller.imageList,
                          animeType: controller.isMovie.value == true
                              ? 'Movie'
                              : controller.isTv.value == true
                                  ? 'TV'
                                  : 'Unknown',
                          animeStatus: controller.isAiring.value == true
                              ? 'Airing'
                              : controller.isFinished.value == true
                                  ? 'Finished'
                                  : 'Not Yet',
                          animeScore: double.parse(
                              controller.animeScoreController.text),
                          animeRank:
                              int.parse(controller.animeRankController.text),
                          animePopularity: int.parse(
                              controller.animePopularityController.text),
                          animeStrory: controller.animeStoryController.text,
                          animeJapaneseName:
                              controller.japaneseNameController.text,
                          animeSource: controller.animeSourceController.text,
                          animeSeasone: controller.animeSeasoneController.text,
                          animeStudio: controller.animeStudioController.text,
                          animeRating: controller.animeRatingController.text,
                          aired: Airing(
                              from: controller.animeAirFromController.text,
                              to: controller.animeAirToController.text),
                          animeLicensor:
                              controller.animeLicensorController.text,
                          animeSynonyms: controller.synonymsController.text,
                          producers: controller.producerList,
                          externalLinks: controller.linkList,
                          animeInfo: controller.infoController.text,
                          animeOtherInfo: controller.otherInfoController.text,
                          trendingNo: controller.isTrending.value == true
                              ? int.parse(controller.trendingNoController.text)
                              : 0,
                          topAiringNo: controller.isTopAired.value == true
                              ? int.parse(controller.topAiredNoController.text)
                              : 0,
                        ),
                      );
                      VxToast.show(context, msg: 'Anime Added Successfully');
                      controller.clearAllTextControllers();
                      Get.offAll(() => const AddAnime());
                    },
                    child: 'Add Anime Type'.text.make(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
