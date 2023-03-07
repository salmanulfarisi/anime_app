import 'dart:developer';

import 'package:anime_app/screens/cast/actor_screen.dart';
import 'package:anime_app/screens/details/widgets/details_widget.dart';
import 'package:anime_app/screens/details/widgets/detil_buttons.dart';
import 'package:anime_app/widgets/widget_conts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic data;
  const DetailsScreen({Key? key, this.data}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int currentpos = 0;
  // get docId
  String get docId => widget.data.id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(docId);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Column(
                    children: [
                      SizedBox(
                          height: size.height * 0.30,
                          width: size.width * 0.60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: CarouselSlider.builder(
                              itemCount: widget.data['posterImg'].length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  width: size.width * 0.60,
                                  height: size.height * 0.30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(
                                        "${widget.data['posterImg'][index]}"),
                                    fit: BoxFit.cover,
                                  )),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                height: size.height * 0.30,
                                viewportFraction: 1,
                                enableInfiniteScroll: false,
                                initialPage: 0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentpos = index;
                                  });
                                },
                              ),
                            ),
                          )),
                      20.heightBox,
                      AnimatedSmoothIndicator(
                        activeIndex: currentpos,
                        count: widget.data['posterImg'].length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Color(0xff06c149),
                          dotHeight: 6,
                          dotWidth: 6,
                          radius: 12,
                          dotColor: Color(0xffe0e0e0),
                        ),
                      )
                    ],
                  ),
                  50.widthBox,
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.heightBox,
                            "Score"
                                .text
                                .white
                                .fontWeight(FontWeight.w500)
                                .make(),
                            rowIconsText(
                              icon: Icons.star_rounded,
                              size: 24.0,
                              text: "${widget.data['score']}"
                                  .text
                                  .white
                                  .size(26)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                            ),
                            10.heightBox,
                            "Rank"
                                .text
                                .white
                                .fontWeight(FontWeight.w500)
                                .make(),
                            rowIconsText(
                              icon: LineIcons.hashtag,
                              color: Colors.blueGrey,
                              size: 24.0,
                              text: "${widget.data['rank']}"
                                  .text
                                  .white
                                  .size(18)
                                  .color(Colors.blueGrey)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                            ),
                            10.heightBox,
                            "Popularity"
                                .text
                                .white
                                .fontWeight(FontWeight.w500)
                                .make(),
                            rowIconsText(
                              icon: LineIcons.hashtag,
                              color: Colors.blueGrey,
                              size: 24.0,
                              text: "${widget.data['popularity']}"
                                  .text
                                  .white
                                  .size(18)
                                  .color(Colors.blueGrey)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                            ),
                            10.heightBox,
                            "Status"
                                .text
                                .white
                                .fontWeight(FontWeight.w500)
                                .make(),
                            "${widget.data['status']}"
                                .text
                                .white
                                .size(18)
                                .color(Colors.green)
                                .fontWeight(FontWeight.bold)
                                .make(),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
                20.heightBox,
                Container(
                  height: size.height * 0.15,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailButton(
                              context: context,
                              texts: "Watch Now",
                              icon: CupertinoIcons.play_arrow_solid),
                          20.widthBox,
                          detailButton(
                              context: context,
                              texts: "Add to Watchlist",
                              icon: CupertinoIcons.plus_circle),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/loffyshare.png",
                            height: size.height * 0.10,
                          ),
                          'Share our\n app'
                              .text
                              .color(Colors.green)
                              .align(TextAlign.center)
                              .bold
                              .make(),
                        ],
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                'Overview'
                    .text
                    .white
                    .size(18)
                    .fontWeight(FontWeight.bold)
                    .make(),
                10.heightBox,
                ReadMoreText(
                  '${widget.data['overview']}',
                  trimLines: 5,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                  moreStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                10.heightBox,
                rowText(
                    title: 'Japanese :',
                    subtitle: '${widget.data['japanese']}'),
                rowText(
                    title: 'Synonyms :',
                    subtitle: '${widget.data['synonyms']}'),
                rowText(
                    title: 'Rating :', subtitle: '${widget.data['rating']}'),
                rowText(
                    title: 'Studios :', subtitle: '${widget.data['studios']}'),
                rowText(
                    title: 'Genres :', subtitle: 'Action, Adventure, Comedy'),
                rowText(
                    title: 'Total Episodes :',
                    subtitle: '${widget.data['total_episodes'] ?? '?'}'),
                rowText(
                    title: 'Aired :',
                    subtitle:
                        '${widget.data['aired']['from']} to ${widget.data['aired']['to'] ?? '?'}'),
                rowText(
                    title: 'Producers :',
                    subtitle: '${widget.data['producers']}'),
                // rowText(
                //     title: 'Licensors :',
                //     subtitle: '${widget.data['Licensors']}'),
                // rowText(
                //     title: 'Source :', subtitle: '${widget.data['source']}'),
                10.heightBox,
                'characters & voice actors'
                    .text
                    .white
                    .size(18)
                    .fontWeight(FontWeight.bold)
                    .make(),
                10.heightBox,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return castContainer(
                      context: context,
                      charOnpress: () {},
                      actorOnpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VoiceActorScreen()));
                      },
                      charectorName:
                          "${widget.data['characters&actors'][index]['char_name']}",
                      role:
                          "${widget.data['characters&actors'][index]['char_role']}",
                      actor:
                          "${widget.data['characters&actors'][index]['act_name']}",
                      place:
                          "${widget.data['characters&actors'][index]['act_place']}",
                      actorImg:
                          "${widget.data['characters&actors'][index]['actImg']}",
                      charImg:
                          "${widget.data['characters&actors'][index]['charImg']}",
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 10.heightBox;
                  },
                  itemCount: widget.data['characters&actors'].length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
