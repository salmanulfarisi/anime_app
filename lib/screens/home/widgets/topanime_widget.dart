import 'package:anime_app/widgets/widget_conts.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                Expanded(
                  flex: 5,
                  child: RotatedBox(
                    quarterTurns: 3, // rotate the text by 90 degrees clockwise
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: animeName.text
                          .fontWeight(FontWeight.normal)
                          .size(18)
                          .overflow(TextOverflow.ellipsis)
                          .white
                          .make(),
                    ),
                  ),
                ),
                10.heightBox,
                Expanded(
                  flex: 1,
                  child: '$index'
                      .text
                      .color(Colors.green)
                      .fontWeight(FontWeight.bold)
                      .size(32)
                      .make(),
                ),
              ],
            ),
          ),
        ),
        CachedNetworkImage(
          imageUrl: animeImage,
          imageBuilder: (context, imageProvider) => Container(
            width: size.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageProvider,
              ),
            ),
          ),
          placeholder: (context, url) => listviewShimmer(context: context),
          errorWidget: (context, url, error) => const Icon(Icons.error),

          // child: Container(
          //   width: size.width * 0.4,
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     borderRadius: const BorderRadius.only(
          //       topRight: Radius.circular(10),
          //       bottomRight: Radius.circular(10),
          //     ),
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: NetworkImage(animeImage),
          //     ),
          //   ),
          // ),
        ),
      ],
    ),
  );
}
