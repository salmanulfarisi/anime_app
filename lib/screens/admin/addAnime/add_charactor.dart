import 'dart:developer';

import 'package:anime_app/screens/admin/addAnime/widgets/custom_textfield.dart';
import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/model/charactor_model.dart';
import 'package:anime_app/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddCharactor extends StatefulWidget {
  const AddCharactor({Key? key}) : super(key: key);

  @override
  State<AddCharactor> createState() => _AddCharactorState();
}

class _AddCharactorState extends State<AddCharactor> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminController>();
    return Scaffold(
      appBar: AppBar(
        title: "Add Charactor".text.white.make(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              customTextField(
                  hint: 'anime Id',
                  controller: controller.charIdController,
                  suffix: controller.charIdController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () async {
                            await FireStoreServices.getAnimeNameById(
                                context, controller.charIdController.text);
                          },
                          icon: const Icon(Icons.search, color: Colors.white),
                        )),
              10.heightBox,
              customTextField(
                hint: 'character Name',
                controller: controller.charNameController,
              ),
              10.heightBox,
              customTextField(
                  hint: 'character Image',
                  controller: controller.charImageController),
              10.heightBox,
              controller.charIdController.text.isEmpty
                  ? GestureDetector(
                      onTap: () {
                        controller.addCharactor();
                        log("${controller.charactorList[0].name}]}}");
                      },
                      child: Container(
                        width: context.screenWidth,
                        height: context.screenHeight * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: 'Add Charactor'.text.white.makeCentered(),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('adminAnime')
                            .doc(controller.charIdController.text)
                            .set({
                          'charactorList': FieldValue.arrayUnion([
                            Charactor(
                                name: controller.charNameController.text,
                                image: controller.charImageController.text)
                          ])
                        }, SetOptions(merge: true));
                        log(controller.charactorList.toString());
                      },
                      child: Container(
                        width: context.screenWidth,
                        height: context.screenHeight * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child:
                            'Add Charactor to ${controller.charIdController.text}'
                                .text
                                .white
                                .makeCentered(),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
