import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MoreInfo extends StatelessWidget {
  final dynamic data;
  const MoreInfo({Key? key, this.data}) : super(key: key);

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
              Text(
                "${data['animeInfo']}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Japanese".text.white.make(),
                  "${data['animeJapaneseName']}".text.white.make(),
                ],
              ),
              20.heightBox,
              Visibility(
                visible: data['animeSynonyms'] != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Synonyms".text.white.make(),
                    "${data['animeSynonyms']}".text.white.make(),
                  ],
                ),
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Producers".text.white.make(),
                  Row(
                    children: List.generate(
                      data == null ? 0 : data['producers'].length,
                      (index) => "${data['producers'][index]['name']} . "
                          .text
                          .color(Colors.blue)
                          .make(),
                    ),
                  ),
                ],
              ),
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "External Links".text.white.make(),
                  Row(
                    children: List.generate(
                      data == null ? 0 : data['externalLinks'].length,
                      (index) => "${data['externalLinks'][0]['name']} . "
                          .text
                          .color(Colors.blue)
                          .make(),
                    ),
                  ),
                ],
              ),
              20.heightBox,
              Visibility(
                visible: data['animeOtherInfo'] != '',
                child: "${data['animeOtherInfo']}".text.white.make(),
              ),
            ],
          ),
        ));
  }
}
