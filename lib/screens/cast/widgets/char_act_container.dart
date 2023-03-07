import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget charActContainer(
    {required String img, required String name, required String role}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        colorFilter: const ColorFilter.mode(
          Colors.black38,
          BlendMode.darken,
        ),
        image: NetworkImage(
          img,
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        name.text.white.size(24).fontWeight(FontWeight.bold).make(),
        role.text.white.make(),
      ],
    ),
  );
}
