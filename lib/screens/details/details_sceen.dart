import 'package:anime_app/widgets/widget_conts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _pageController = PageController();
  int currentpos = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * 0.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.15,
            child: Column(
              children: [
                Row(children: [
                  Column(
                    children: [
                      Container(
                          height: size.height * 0.30,
                          width: size.width * 0.60,
                          decoration: const BoxDecoration(),
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
                  20.widthBox,
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.30,
                        width: size.width * 0.35,
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
                                .black
                                .fontWeight(FontWeight.w500)
                                .make(),
                            rowIconsText(
                              icon: Icons.star_rounded,
                              size: 24.0,
                              text: "8.5"
                                  .text
                                  .black
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
                  height: size.height * 0.20,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * 0.05,
                        left: size.width * 0.10,
                        right: size.width * 0.10,
                        child: Container(
                            width: size.width * 10,
                            height: size.height * 0.10,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  LineIcons.play,
                                  color: Colors.white,
                                  size: 34,
                                ),
                                "Watch Now"
                                    .text
                                    .white
                                    .size(18)
                                    .fontWeight(FontWeight.bold)
                                    .make()
                              ],
                            )),
                      ),
                      Positioned(
                        top: size.height * 0.10,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/loffyshare.png",
                              height: size.height * 0.10,
                            ),
                            15.widthBox,
                            Positioned(
                              top: size.height * 0.05,
                              right: 0,
                              child: 'Share our\n app'
                                  .text
                                  .color(Colors.green)
                                  .align(TextAlign.center)
                                  .bold
                                  .make(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
