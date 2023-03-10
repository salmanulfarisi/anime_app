import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget dropDown(onchaged, String hint, List<String> items, String dropvalue) {
  return DropdownButtonHideUnderline(
    child: DropdownButton(
      hint: hint.text.make(),
      value: dropvalue == '' ? null : dropvalue,
      items: items.map((e) {
        return DropdownMenuItem(
          value: e,
          child: e.toString().text.white.make(),
        );
      }).toList(),
      onChanged: onchaged,
    ),
  )
      .box
      .white
      .roundedSM
      .padding(const EdgeInsets.symmetric(horizontal: 4))
      .make();
}
