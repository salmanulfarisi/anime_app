import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget builderContainer({color, imge}) {
  return Stack(
    children: [
      CachedNetworkImage(
        imageUrl: "$imge",
        imageBuilder: (context, imageProvider) => Container(
          padding: const EdgeInsets.all(8),
          width: 150,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.black12,
                    BlendMode.darken,
                  ),
                  image: imageProvider)),
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
          );
        },
        // child: Container(
        //   padding: const EdgeInsets.all(8),
        //   width: 150,
        //   decoration: BoxDecoration(
        //       color: color,
        //       borderRadius: BorderRadius.circular(10),
        //       image: DecorationImage(
        //         colorFilter: const ColorFilter.mode(
        //           Colors.black12,
        //           BlendMode.darken,
        //         ),
        //         image: NetworkImage("$imge"),
        //         fit: BoxFit.cover,
        //       )),
        // ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: 'Name'.text.white.make(),
          ),
        ),
      )
    ],
  );
}

Widget builderContainerColumn({color, imge}) {
  return Stack(
    children: [
      CachedNetworkImage(
        imageUrl: "$imge",
        imageBuilder: (context, imageProvider) => Container(
          padding: const EdgeInsets.all(8),
          width: 150,
          decoration: BoxDecoration(
              color: color,
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
              'Name'.text.white.make(),
              10.heightBox,
              Row(
                children: [
                  Expanded(
                    child: 'Type'.text.white.make(),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: "Ep:1".text.white.makeCentered(),
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
          );
        },
        // child: Container(
        //   padding: const EdgeInsets.all(8),
        //   width: 150,
        //   decoration: BoxDecoration(
        //       color: color,
        //       borderRadius: BorderRadius.circular(10),
        //       image: DecorationImage(
        //         colorFilter: const ColorFilter.mode(
        //           Colors.black12,
        //           BlendMode.darken,
        //         ),
        //         image: NetworkImage("$imge"),
        //         fit: BoxFit.cover,
        //       )),
        // ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Name'.text.white.make(),
              'Position'.text.white.make(),
            ],
          ),
        ),
      )
    ],
  );
}
