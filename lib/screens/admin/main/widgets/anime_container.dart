import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget animeContainer({animeImg, animename, animeType, animeEp}) {
  return CachedNetworkImage(
    imageUrl: "$animeImg",
    imageBuilder: (context, imageProvider) => Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.black12,
                BlendMode.darken,
              ),
              image: imageProvider)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$animename',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          10.heightBox,
          Row(
            children: [
              Expanded(
                child: '$animeType'.text.white.make(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: "Ep:$animeEp".text.white.makeCentered(),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    placeholder: (context, url) => VxShimmer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    errorWidget: (context, url, error) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.error),
      );
    },
    // child: Container(
    //   padding: const EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //       color: Colors.blue,
    //       borderRadius: BorderRadius.circular(10),
    //       image: DecorationImage(
    //           fit: BoxFit.cover,
    //           colorFilter: const ColorFilter.mode(
    //             Colors.black12,
    //             BlendMode.darken,
    //           ),
    //           image: NetworkImage("$animeImg"))),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         '$animename',
    //         overflow: TextOverflow.ellipsis,
    //         style: const TextStyle(
    //             color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    //       ),
    //       10.heightBox,
    //       Row(
    //         children: [
    //           Expanded(
    //             child: '$animeType'.text.white.make(),
    //           ),
    //           Expanded(
    //             child: Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.grey,
    //                 borderRadius: BorderRadius.circular(5),
    //               ),
    //               child: "Ep:$animeEp".text.white.makeCentered(),
    //             ),
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
  );
}
