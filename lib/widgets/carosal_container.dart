import 'package:anime_app/utils/const.dart';
import 'package:anime_app/widgets/button_widgets.dart';
import 'package:anime_app/widgets/widget_conts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget carosalContainer({
  context,
  caroselRanking,
  caroselTitle,
  caroselAnimeType,
  caroselEpisodes,
  caroselStareted,
  caroselType,
  caroselSynopsis,
  caroselImg,
  caroselAnimedesc,
}) {
  final size = MediaQuery.of(context).size;
  return Stack(
    children: [
      Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            // colorFilter: ColorFilter.mode(
            //   Colors.black54,
            //   BlendMode.darken,
            // ),
            image: NetworkImage(caroselImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black87,
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "$caroselRanking".text.color(Colors.greenAccent).make(),
            SizedBox(
              width: size.width * 1.0,
              child: "$caroselTitle"
                  .text
                  .color(Colors.white)
                  .xl3
                  .overflow(TextOverflow.ellipsis)
                  .make(),
            ),
            Row(
              children: [
                rowIconsText(
                  icon: Icons.play_arrow,
                  text: "$caroselAnimeType".text.color(Colors.white).make(),
                ),
                10.widthBox,
                rowIconsText(
                  icon: Icons.tv,
                  text: "$caroselEpisodes".text.color(Colors.white).make(),
                ),
                10.widthBox,
                rowIconsText(
                  icon: Icons.calendar_month,
                  text: "$caroselStareted".text.color(Colors.white).make(),
                ),
              ],
            ),
            10.heightBox,
            SizedBox(
              width: size.width * 0.7,
              child: "$caroselAnimedesc"
                  .text
                  .color(Colors.white)
                  .maxLines(3)
                  .overflow(TextOverflow.ellipsis)
                  .make(),
            ),
            10.heightBox,
            Row(
              children: [
                buttonWidgets(
                    text: caroselWatchNow.text.color(Colors.black87).make(),
                    icon: Icons.play_arrow),
                10.widthBox,
                buttonIconRightWidgets(
                    text: caroselMoreInfo.text.color(Colors.white).make(),
                    icon: Icons.arrow_right_rounded,
                    color: Colors.grey[800]),
                // caroselWatchNow.text.color(Colors.white).make(),
                // 10.widthBox,
                // caroselMoreInfo.text.color(Colors.white).make(),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
