import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget buttonWidgets({icon, text}) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.black87,
        size: 15,
      ),
      text,
    ],
  )
      .box
      .white
      .padding(const EdgeInsets.all(8))
      .rounded
      .color(Colors.lightGreenAccent)
      .makeCentered();
}

Widget buttonIconRightWidgets({icon, text, color}) {
  return Row(
    children: [
      text,
      Icon(
        icon,
        color: Colors.white,
        size: 15,
      ),
    ],
  )
      .box
      .white
      .padding(const EdgeInsets.all(8))
      .rounded
      .color(color)
      .makeCentered();
}
