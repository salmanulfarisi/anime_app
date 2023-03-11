import 'package:anime_app/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/widgets/charactor.dart';
import 'package:anime_app/screens/admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class ActorsPage extends StatefulWidget {
  const ActorsPage({Key? key}) : super(key: key);

  @override
  State<ActorsPage> createState() => _ActorsPageState();
}

class _ActorsPageState extends State<ActorsPage> {
  final controller = Get.find<AdiminController>();

  void _onTextChanged() {
    setState(() {
      controller.isSkillSelected =
          controller.actorSkillController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    print(controller.imgUrl);
    controller.actorSkillController.addListener(_onTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: 'Actors'.text.make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                10.heightBox,
                adminTextformField(
                    hint: "actor Image",
                    controller: controller.actorImageController),
                10.heightBox,
                adminTextformField(
                    hint: "actor Name",
                    controller: controller.actorNameController),
                10.heightBox,
                adminTextformField(
                    hint: "actor place",
                    controller: controller.actorPlaceController),
                10.heightBox,
                adminTextformField(
                    hint: "actor Profile",
                    controller: controller.actorPRofileController),
                10.heightBox,
                adminTextformField(
                    hint: "blood Type",
                    controller: controller.actorBloodTypeController),
                10.heightBox,
                adminTextformField(
                    hint: "birthplace",
                    controller: controller.actorBirthplaceController),
                10.heightBox,
                adminTextformField(
                    hint: "birthName",
                    controller: controller.actorbirthNameController),
                10.heightBox,
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.75,
                      child: adminTextformField(
                        hint: "skills",
                        controller: controller.actorSkillController,
                      ),
                    ),
                    10.widthBox,
                    Column(
                      children: [
                        '${controller.currentIndex}added'.text.white.make(),
                        TextButton(
                          onPressed: () {
                            controller.currentIndex++;

                            controller.skills
                                .add(controller.actorSkillController.text);
                            controller.actorSkillController.clear();
                          },
                          child: "Add".text.make(),
                        )
                      ],
                    )
                  ],
                ),
                10.heightBox,
                SizedBox(
                    width: size.width * 0.5,
                    child: controller.actorValidate()
                        ? ElevatedButton(
                            onPressed: () async {
                              await controller.addActor();
                              controller.clickedIndex++;
                            },
                            child: "Add Actor".text.make(),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            onPressed: () {
                              VxToast.show(context,
                                  bgColor: Colors.black,
                                  textColor: Colors.white,
                                  msg: "Please fill all the fields");
                            },
                            child: "Add Actor".text.make(),
                          )),
                20.heightBox,
                controller.clickedIndex > 1
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => const CharacterPage());
                        },
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              'Add Charactors'
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                              10.widthBox,
                              const Icon(LineIcons.arrowCircleRight)
                            ],
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }
}
