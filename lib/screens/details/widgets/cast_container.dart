import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget castContainer({
  context,
  required String charectorName,
  required String role,
  required String actor,
  required String place,
  required String charImg,
  required String actorImg,
  Function()? charOnpress,
  actorOnpress,
}) {
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
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(charImg),
            ),
            10.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: charOnpress,
                  // onTap: () {
                  //   // Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (context) => const CastScreen()));
                  // },
                  child: charectorName.text.white.make(),
                ),
                role.text.white.make(),
              ],
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: actorOnpress,
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const VoiceActorScreen()));
                  // },
                  child: actor.text.white.make(),
                ),
                place.text.white.make(),
              ],
            ),
            10.widthBox,
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(actorImg),
            ),
          ],
        ),
      ],
    ),
  );
}
