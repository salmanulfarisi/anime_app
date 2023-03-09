import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget actingRolesContainer(
    {context,
    required String img,
    animeName,
    animeRole,
    charName,
    charRole,
    charImg}) {
  final size = MediaQuery.of(context).size;
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
              child: Image.network(
                img,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
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
                  child: SizedBox(
                    width: size.width * 0.4,
                    child: "$animeName".text.white.make(),
                  ),
                ),
                "$animeRole".text.white.make(),
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const VoiceActorScreen()));
                  },
                  child: SizedBox(
                    width: size.width * 0.2,
                    child: "$charName"
                        .text
                        .white
                        .overflow(TextOverflow.ellipsis)
                        .make(),
                  ),
                ),
                "$charRole".text.white.make(),
              ],
            ),
            10.widthBox,
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage("$charImg"),
            ),
          ],
        ),
      ],
    ),
  );
}
