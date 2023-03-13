import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget statusContainer({context, ontap, isSelect, text, borderColor}) {
  final size = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: size.width * 0.25,
      height: size.height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                fontSize: 14,
              ),
            ).centered()
          : Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ).centered(),
    ),
  );
}
