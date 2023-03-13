import 'dart:developer';

import 'package:anime_app/screens/admin/addAnime/add_animetype.dart';
import 'package:anime_app/screens/admin/addAnime/widgets/custom_textfield.dart';
import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/details/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddMoreInfo extends StatelessWidget {
  const AddMoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add More Info'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(
                  controller: controller.animeSourceController,
                  hint: 'anime Source',
                ),
                10.heightBox,
                customTextField(
                  controller: controller.animeSeasoneController,
                  hint: 'anime Season',
                ),
                10.heightBox,
                customTextField(
                  controller: controller.animeStudioController,
                  hint: 'anime Studio',
                ),
                10.heightBox,
                customTextField(
                  controller: controller.animeLicensorController,
                  hint: 'anime Licenser',
                ),
                10.heightBox,
                titleText(title: 'Aired'),
                10.heightBox,
                Wrap(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.4,
                      child: customTextField(
                        controller: controller.animeAirFromController,
                        hint: 'From',
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.4,
                      child: customTextField(
                        controller: controller.animeAirToController,
                        hint: 'To',
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                customTextField(
                  controller: controller.infoController,
                  hint: 'Info',
                  isstory: true,
                  maxlines: 5,
                ),
                10.heightBox,
                customTextField(
                  controller: controller.japaneseNameController,
                  hint: 'Japanese Name',
                ),
                10.heightBox,
                customTextField(
                  controller: controller.synonymsController,
                  hint: 'Synonyms',
                ),
                10.heightBox,
                titleText(title: 'Producers'),
                10.heightBox,
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.4,
                      child: customTextField(
                        controller: controller.producerController,
                        hint: 'Producer',
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.4,
                      child: customTextField(
                        controller: controller.producerLinkController,
                        hint: 'Link',
                      ),
                    ),
                    Visibility(
                        visible: controller.checkProducerFieldsFilled(),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.addProducer(context);
                                log(controller.producerList.toString());
                              },
                              child: Container(
                                width: context.screenWidth * 0.4,
                                height: context.screenHeight * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: const Text('Add Producers').centered(),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.removeProducer(
                                    controller.producerList.length - 1,
                                    context);
                                log(controller.producerList.toString());
                              },
                              child: Container(
                                width: context.screenWidth * 0.4,
                                height: context.screenHeight * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                ),
                                child: "Remove Producers"
                                    .text
                                    .white
                                    .makeCentered(),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                10.heightBox,
                titleText(title: 'External Links'),
                10.heightBox,
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: context.screenWidth * 0.4,
                      child: customTextField(
                        controller: controller.linkNameController,
                        hint: 'Link Name',
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.4,
                      child: customTextField(
                        controller: controller.linkController,
                        hint: 'Link',
                      ),
                    ),
                    Visibility(
                        visible: controller.checkLinkFieldsFilled(),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.addLink(context);
                                log(controller.linkList.toString());
                              },
                              child: Container(
                                width: context.screenWidth * 0.4,
                                height: context.screenHeight * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: const Text('Add Link').centered(),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.removeLink(
                                    controller.linkList.length - 1, context);
                                log(controller.linkList.toString());
                              },
                              child: Container(
                                width: context.screenWidth * 0.4,
                                height: context.screenHeight * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                ),
                                child: "Remove Link".text.white.makeCentered(),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                10.heightBox,
                customTextField(
                  controller: controller.otherInfoController,
                  hint: 'Other Info',
                  isstory: true,
                  maxlines: 5,
                ),
                10.heightBox,
                GestureDetector(
                  onTap: () {
                    if (controller.checkInfoFieldsFilled()) {
                      Get.to(() => const AddAnimeType());
                    } else {
                      VxToast.show(context, msg: 'Please fill all the fields');
                    }
                  },
                  child: Container(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: const Text('Add More Info').centered(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
