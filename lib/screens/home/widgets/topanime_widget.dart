import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget topAnime(
    {context, required String animeName, required String animeImage, index}) {
  final size = MediaQuery.of(context).size;
  return Container(
    child: Row(
      children: [
        Container(
          width: size.width * 0.15,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey,
                  Colors.black38,
                ]),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                RotatedBox(
                  quarterTurns: 3, // rotate the text by 90 degrees clockwise
                  child: animeName.text
                      .fontWeight(FontWeight.normal)
                      .size(18)
                      .overflow(TextOverflow.ellipsis)
                      .white
                      .make(),
                ),
                const Spacer(),
                '$index'
                    .text
                    .color(Colors.green)
                    .fontWeight(FontWeight.bold)
                    .size(32)
                    .make(),
              ],
            ),
          ),
        ),
        Container(
          width: size.width * 0.4,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(animeImage),
              )),
        ),
      ],
    ),
  );
}
