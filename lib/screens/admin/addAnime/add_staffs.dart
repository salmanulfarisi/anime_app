import 'package:anime_app/screens/admin/addAnime/widgets/custom_textfield.dart';
import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/details/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AddStaffs extends StatelessWidget {
  const AddStaffs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Staffs'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(title: 'Add Staffs'),
                10.heightBox,
                customTextField(
                  hint: 'Staff Name',
                  controller: controller.charNameController,
                ),
                10.heightBox,
                customTextField(
                    hint: 'Staff Image',
                    controller: controller.charImageController),
                10.heightBox,
                customTextField(
                  hint: 'Staff Position',
                  controller: controller.charRoleController,
                ),
                10.heightBox,
                customTextField(
                  hint: 'Staff Link',
                  controller: controller.charRoleController,
                ),
                10.heightBox,
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: 'Add Staff'.text.white.makeCentered(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
