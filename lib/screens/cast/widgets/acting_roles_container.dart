import 'package:anime_app/screens/cast/actor_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget actingRolesContainer({context}) {
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
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/loffyshare.png',
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )),
            10.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>  CastScreen()));
                  },
                  child: 'Monkey D. Luffy'.text.white.make(),
                ),
                'Main Character'.text.white.make(),
              ],
            )
          ],
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VoiceActorScreen()));
                  },
                  child: 'Mother Nanba'.text.white.make(),
                ),
                'Supporting'.text.white.make(),
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
