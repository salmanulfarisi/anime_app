import 'package:anime_app/screens/admin/addAnime/add_charactor.dart';
import 'package:anime_app/screens/admin/addAnime/add_moreinfo.dart';
import 'package:anime_app/screens/admin/addAnime/widgets/anime_type_container.dart';
import 'package:anime_app/screens/admin/addAnime/widgets/custom_textfield.dart';
import 'package:anime_app/screens/admin/addAnime/widgets/status_container.dart';
import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/details/widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class AddAnime extends StatelessWidget {
  const AddAnime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(AdminController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Anime'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const AddCharactor());
              },
              icon: const Icon(CupertinoIcons.add),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(title: 'Add Image'),
                10.heightBox,
                Obx(
                  () => controller.imageList.isEmpty
                      ? Container(
                          width: size.width,
                          height: size.height * 0.2,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.transparent,
                          ),
                          child: const Center(
                            child: Text('No Image Added.Add Image URL',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      : SizedBox(
                          height: size.height * 0.2,
                          width: size.width,
                          child: Row(
                            children: List.generate(
                              controller.imageList.length,
                              (index) => Container(
                                width: size.width * 0.3,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller.imageList[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
                10.heightBox,
                Obx(
                  () => Row(
                    children: [
                      'Add Image URL here'.text.white.make(),
                      const Spacer(),
                      '${controller.currentImageIndex} Image Added'
                          .text
                          .white
                          .make(),
                    ],
                  ),
                ),
                10.heightBox,
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: TextFormField(
                        controller: controller.animeImageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            hintText: 'Enter Image URL',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                    ),
                    10.widthBox,
                    GestureDetector(
                      onTap: () {
                        controller.addImage(
                          controller.animeImageController.text,
                          context,
                        );
                        print(controller.imageList);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    10.widthBox,
                    GestureDetector(
                      onTap: () {
                        if (controller.imageList.length > 1) {
                          controller.showRemoveImageDialog(
                              controller.imageList.lastIndex!, context);
                          print(controller.imageList);
                        } else {
                          VxToast.show(context,
                              msg: 'Atleast 1 image is required');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                customTextField(
                  controller: controller.animeNameController,
                  hint: 'Enter Anime Name',
                ),
                10.heightBox,
                customTextField(
                  controller: controller.animeVideoController,
                  hint: 'Enter Anime video URL',
                ),
                20.heightBox,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      animeTypeContainer(
                        isSelected: controller.isMovie.value,
                        context: context,
                        icon: LineIcons.film,
                        label: 'Movie',
                        onpress: () {
                          controller.selectMovie();
                        },
                      ),
                      animeTypeContainer(
                        isSelected: controller.isTv.value,
                        context: context,
                        icon: LineIcons.television,
                        label: 'Tv',
                        onpress: () {
                          controller.selectTv();
                        },
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        'Popularity'.text.white.make(),
                        10.heightBox,
                        SizedBox(
                            width: size.width * 0.2,
                            child: customTextField(
                              keyboardtype: TextInputType.number,
                              controller: controller.animePopularityController,
                              hint: 'popularity',
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        'Rank'.text.white.make(),
                        10.heightBox,
                        SizedBox(
                          width: size.width * 0.2,
                          child: customTextField(
                            keyboardtype: TextInputType.number,
                            controller: controller.animeRankController,
                            hint: 'Rank',
                          ),
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
                          child: customTextField(
                            keyboardtype: TextInputType.number,
                            controller: controller.animeScoreController,
                            hint: 'Score',
                          ),
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
                          child: customTextField(
                            controller: controller.animeRatingController,
                            hint: 'Rating',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                20.heightBox,
                titleText(title: 'Episodes'),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        'Current Episode'.text.white.make(),
                        SizedBox(
                          width: size.width * 0.3,
                          child: customTextField(
                            keyboardtype: TextInputType.number,
                            controller:
                                controller.animeCurrentEpisodeController,
                            hint: 'Current Episode',
                          ),
                        ),
                      ],
                    ),
                    10.widthBox,
                    Column(
                      children: [
                        'Total Episodes'.text.white.make(),
                        SizedBox(
                          width: size.width * 0.3,
                          child: customTextField(
                            keyboardtype: TextInputType.number,
                            controller: controller.animeTotalEpisodeController,
                            hint: 'Total Episodes',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                20.heightBox,
                titleText(title: 'Status'),
                10.heightBox,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      statusContainer(
                        context: context,
                        text: 'Airing',
                        ontap: () {
                          controller.selectAiring();
                        },
                        borderColor: Colors.green,
                        isSelect: controller.isAiring.value,
                      ),
                      statusContainer(
                        context: context,
                        text: 'Finished',
                        ontap: () {
                          controller.selectFinished();
                        },
                        borderColor: Colors.blue,
                        isSelect: controller.isFinished.value,
                      ),
                      statusContainer(
                        context: context,
                        text: 'Not Released',
                        ontap: () {
                          controller.selectNotyet();
                        },
                        borderColor: Colors.white,
                        isSelect: controller.isNotyet.value,
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                customTextField(
                  controller: controller.animeStoryController,
                  hint: 'story',
                  isstory: true,
                ),
                20.heightBox,
                Visibility(
                  visible: controller.checkAllFieldsFilled(),
                  child: GestureDetector(
                    onTap: () {
                      // controller.addAnime(context);
                      Get.to(() => const AddMoreInfo());
                    },
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: 'Add More Info'
                          .text
                          .fontWeight(FontWeight.bold)
                          .white
                          .makeCentered(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
