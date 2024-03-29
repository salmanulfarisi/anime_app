import 'package:anime_app/screens/admin/controller/admin_controller.dart';
import 'package:anime_app/screens/admin/details/more_info.dart';
import 'package:anime_app/screens/admin/details/widgets/builder_container.dart';
import 'package:anime_app/screens/admin/details/widgets/carousel_widet.dart';
import 'package:anime_app/screens/admin/details/widgets/colum_row_text.dart';
import 'package:anime_app/screens/admin/details/widgets/title_text.dart';
import 'package:anime_app/screens/admin/details/widgets/youtube.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimeDetailsAdmin extends StatelessWidget {
  final dynamic data;
  const AnimeDetailsAdmin({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(AdminController());
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data['animeName'], style: const TextStyle(fontSize: 18)),
              Row(
                children: [
                  Text(data['animeType'], style: const TextStyle(fontSize: 12)),
                  const Text(".", style: TextStyle(fontSize: 12)),
                  Text(
                      "Ep: ${data['episodes']['currentEpisode']}/${data['episodes']['totalEpisodes']}",
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(LineIcons.edit, color: Colors.blue),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.delete, color: Colors.red),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                carousalWidget(
                    data: data, controller: controller, context: context),
                10.heightBox,
                Container(
                  width: size.width,
                  height: size.height * 0.1,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      columRowText(
                          title: 'Score',
                          icon: Icons.star,
                          color: Colors.yellow,
                          content: '${data['animeScore']}'),
                      columRowText(
                          title: 'Rank',
                          icon: LineIcons.hashtag,
                          color: Colors.greenAccent,
                          content: '${data['animeRank']}'),
                      columRowText(
                          title: 'Popularity',
                          icon: LineIcons.hashtag,
                          color: Colors.greenAccent,
                          content: '${data['animePopularity']}'),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Status"
                              .text
                              .white
                              .fontWeight(FontWeight.bold)
                              .make(),
                          Text(
                            "${data['animeStatus']}",
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                10.heightBox,
                ReadMoreText(
                  '${data['animeStrory']}',
                  trimLines: 5,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  moreStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                // 10.heightBox,
                // const VideoContainer(),
                10.heightBox,
                Youtube(
                  data: data,
                ),
                Row(
                  children: [
                    titleText(title: 'Anime Info'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.to(() => MoreInfo(data: data));
                      },
                      child: const Text(
                        "More Info",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.white12, Colors.black54],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Japanese'.text.color(Colors.grey).make(),
                      '${data['animeJapaneseName']}'
                          .text
                          .color(Colors.white)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Source'.text.color(Colors.grey).make(),
                                '${data['animeSource']}'
                                    .text
                                    .color(Colors.white)
                                    .make(),
                              ],
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Season'.text.color(Colors.grey).make(),
                                '${data['animeSeasone']}'
                                    .text
                                    .color(Colors.white)
                                    .make(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Studio'.text.color(Colors.grey).make(),
                                '${data['animeStudio']}'
                                    .text
                                    .color(Colors.blue)
                                    .make(),
                              ],
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Aired'.text.color(Colors.grey).make(),
                                '${data['aired']['from']} to ${data['aired']['to'] == '' ? '?' : data['aired']['to']}'
                                    .text
                                    .color(Colors.white)
                                    .make(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Rating'.text.color(Colors.grey).make(),
                                '${data['animeRating']}'
                                    .text
                                    .color(Colors.white)
                                    .make(),
                              ],
                            ),
                          ),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Licensor'.text.color(Colors.grey).make(),
                                '${data['animeLicensor']}'
                                    .text
                                    .color(Colors.blue)
                                    .make(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    titleText(title: 'Cast'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "More Cast",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return builderContainer(
                              charactorName: data['charactors'][index]
                                  ['charactorName'],
                              color: index.isEven ? Colors.blue : Colors.red,
                              imge:
                                  "${data['charactors'][index]['charactorImage']}",
                            );
                          },
                          separatorBuilder: (context, index) => 10.widthBox,
                          itemCount: data['charactors'].length,
                        ),
                      ),
                      10.heightBox,
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => builderContainer(
                            charactorName:
                                '${data['actors'][index]['actorName']}',
                            color: index.isEven ? Colors.blue : Colors.red,
                            imge: '${data['actors'][index]['actorImage']}',
                          ),
                          separatorBuilder: (context, index) => 10.widthBox,
                          itemCount: data['actors'].length,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    titleText(title: 'Staff'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "More staff",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => builderContainerColumn(
                      color: index.isEven ? Colors.white : Colors.amber,
                      imge:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7H1LbyJc8E4fLcc4nIff1k1t196Kx0IFJ7NU7QRJJoQYVK4bUKDbmb-KrQfWjMo2yD0o&usqp=CAU',
                    ),
                    separatorBuilder: (context, index) => 10.widthBox,
                    itemCount: 10,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
