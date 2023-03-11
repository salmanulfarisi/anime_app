import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget columRowText({title, icon, color, content}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "$title".text.white.fontWeight(FontWeight.bold).make(),
      Row(
        children: [
          Icon(icon, color: color),
          Text("$content",
              style: const TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    ],
  );
}
