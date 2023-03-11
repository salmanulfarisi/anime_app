import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminController extends GetxController {
  var currentIndex = 0.obs;
  var currentImageIndex = 0.obs;

  var imageList = <String>[].obs;

  // text controllers
  var animeImageController = TextEditingController();

  void addImage(String url, context) {
    imageList.add(url);
    currentImageIndex++;
    VxToast.show(context, msg: 'Image Added');
  }

  void removeImage(int index, context) {
    imageList.removeAt(index);
    currentImageIndex--;
    VxToast.show(context, msg: 'Image Removed');
  }
}
