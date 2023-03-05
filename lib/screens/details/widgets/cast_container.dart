import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget castContainer() {
  return Container(
    height: 100,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/loffyshare.png'),
            ),
            10.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Monkey D. Luffy'.text.white.make(),
                'Main Character'.text.white.make(),
              ],
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Tanaka, Mayumi'.text.white.make(),
                'Japanese'.text.white.make(),
              ],
            ),
            10.widthBox,
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/loffyshare.png'),
            ),
          ],
        ),
      ],
    ),
  );
}
