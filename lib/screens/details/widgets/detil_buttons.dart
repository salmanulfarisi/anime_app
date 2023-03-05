import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget detailButton({
  context,
  required String texts,
  icon,
  textSize = 16.0,
  iconSize = 20.0,
}) {
  final size = MediaQuery.of(context).size;
  return Container(
    height: size.height * 0.05,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        color: Colors.greenAccent, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        texts.text.white.size(textSize).fontWeight(FontWeight.bold).make()
      ],
    ),
  );
}
