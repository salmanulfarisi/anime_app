import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

Widget videoContainer({context}) {
  final size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height * 0.25,
    decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10)),
    child: const Center(
        child: Icon(
      LineIcons.playCircle,
      color: Colors.white,
      size: 50,
    )),
  );
}
