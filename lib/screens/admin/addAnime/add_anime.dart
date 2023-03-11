import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/details/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(title: 'Add Image'),
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
                        controller.removeImage(1, context);
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
              )
            ],
          ),
        ));
  }
}
