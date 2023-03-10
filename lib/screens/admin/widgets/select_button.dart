import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget selectButton({context, ontap, isSelect, text, borderColor}) {
  final size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: size.width * 0.3,
      height: size.height * 0.07,
      decoration: isSelect
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: borderColor,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white),
            ),
      child: isSelect
          ? Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ).centered()
          : Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ).centered(),
    ),
  );
}
