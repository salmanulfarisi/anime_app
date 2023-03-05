import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget rowText({required String title, required String subtitle}) {
  return Row(
    children: [
      title.text.white.size(16).fontWeight(FontWeight.bold).make(),
      10.widthBox,
      subtitle.text.white.size(14).make(),
    ],
  );
}
