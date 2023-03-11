import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MoreInfo extends StatelessWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const url = "https://en.m.wikipedia.org/wiki/One_Piece";
    return Scaffold(
        appBar: AppBar(
          title: const Text('More Info'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "More Zoro is the best site to watch Golden Kamuy Season 4 SUB online, or you can even watch Golden Kamuy Season 4 DUB in HD quality. You can also find Brain's Base anime on Zoro website. You can also find Brain's Base anime on Zoro website.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Japanese".text.white.make(),
                  "ゴールデンカムイ".text.white.make(),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Producers".text.white.make(),
                  "FujiTv".text.white.make(),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "External Links".text.white.make(),
                  "Official Site".text.white.make(),
                ],
              ),
            ],
          ),
        ));
  }
}
