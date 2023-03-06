import 'package:anime_app/screens/details/widgets/details_widget.dart';
import 'package:anime_app/screens/details/widgets/detil_buttons.dart';
import 'package:anime_app/utils/const.dart';
import 'package:anime_app/widgets/widget_conts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int currentpos = 0;
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
                              itemCount: 10,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  width: size.width * 0.60,
                                  height: size.height * 0.30,
                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? Colors.white
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: "$index".text.black.make(),
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
                        count: 10,
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
                              text: "8.5"
                                  .text
                                  .white
                                  .size(32)
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
                              text: "1999"
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
                              text: "1999"
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
                            "Airing"
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
                const ReadMoreText(
                  detailsTitle,
                  trimLines: 5,
                  colorClickableText: Colors.blue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  moreStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                10.heightBox,
                rowText(title: 'Japanese :', subtitle: 'One Piece'),
                rowText(title: 'Synonyms :', subtitle: 'OP'),
                rowText(title: 'Rating :', subtitle: 'R'),
                rowText(title: 'Studios :', subtitle: 'Toei Animation'),
                rowText(
                    title: 'Genres :', subtitle: 'Action, Adventure, Comedy'),
                rowText(title: 'Total Episodes :', subtitle: 'Unknown'),
                rowText(title: 'Aired :', subtitle: 'Oct 20, 1999 to ?'),
                rowText(title: 'Producers :', subtitle: 'Fuji TV'),
                rowText(title: 'Licensors :', subtitle: 'Funimation'),
                rowText(title: 'Source :', subtitle: 'Manga'),
                10.heightBox,
                'Caracters&voice actors'
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
                    return castContainer(context: context);
                  },
                  separatorBuilder: (context, index) {
                    return 10.heightBox;
                  },
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
