import 'dart:developer';

import 'package:anime_app/screens/admin/addAnime/add_staffs.dart';
import 'package:anime_app/screens/admin/addAnime/widgets/custom_textfield.dart';
import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/details/widgets/title_text.dart';
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
        title: "Charactor&Actor".text.white.make(),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const AddStaffs());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(title: 'Add Actor'),
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
              customTextField(
                hint: 'Char Role',
                controller: controller.charRoleController,
              ),
              10.heightBox,
              customTextField(
                hint: 'Char Link',
                controller: controller.charLinkController,
              ),
              10.heightBox,
              GestureDetector(
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
              ),
              20.heightBox,
              titleText(title: 'Add Actor'),
              10.heightBox,
              customTextField(
                hint: 'Actor Name',
                controller: controller.actorNameController,
              ),
              10.heightBox,
              customTextField(
                  hint: 'Actor Image',
                  controller: controller.actorImageController),
              10.heightBox,
              customTextField(
                hint: 'Actor Link',
                controller: controller.actorLinkController,
              ),
              10.heightBox,
              GestureDetector(
                onTap: () {
                  controller.addActor();
                  log("${controller.actorList[0].name}]}}");
                },
                child: Container(
                  width: context.screenWidth,
                  height: context.screenHeight * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: 'Add Actor'.text.white.makeCentered(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
