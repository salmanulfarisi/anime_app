import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget topAnime({context}) {
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
                  child: 'Vertical Text'
                      .text
                      .fontWeight(FontWeight.normal)
                      .size(18)
                      .overflow(TextOverflow.ellipsis)
                      .white
                      .make(),
                ),
                const Spacer(),
                '01'
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
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/welcome_background.png'),
              )),
        ),
      ],
    ),
  );
}
