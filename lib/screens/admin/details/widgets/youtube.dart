import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget youTubePlayer() {
  final controller = Get.find<AdminController>();
  return YoutubePlayer(
    controller: controller.youtubeController,
  );
}
