import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

Widget addContainer({String text = 'Add Character', ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LineIcons.plus,
            color: Colors.white,
          ),
          text.text.align(TextAlign.center).white.make(),
        ],
      ),
    ),
  );
}
