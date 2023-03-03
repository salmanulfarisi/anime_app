import 'package:flutter/material.dart';

Widget rowIconsText({icon, text, size = 15.0, color = Colors.white}) {
  return Row(children: [
    Icon(
      icon,
      color: color,
      size: size,
    ),
    text,
  ]);
}
