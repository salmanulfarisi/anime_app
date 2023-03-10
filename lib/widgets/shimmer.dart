import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget listviewShimmer({context}) {
  final size = MediaQuery.of(context).size;
  return VxShimmer(
    child: Container(
      width: size.width * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),
  );
}

Widget caroselShimmer({context}) {
  final size = MediaQuery.of(context).size;
  return VxShimmer(
    child: Container(
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    ),
  );
}
