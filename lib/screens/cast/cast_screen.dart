import 'package:anime_app/screens/cast/widgets/cast_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class CastScreen extends StatefulWidget {
  final dynamic data;
  final int index;
  const CastScreen({Key? key, this.data, required this.index})
      : super(key: key);

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  int currentpos = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: size.height * 0.3,
                            width: size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: CarouselSlider.builder(
                                itemCount: widget.data['img'].length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    width: size.width * 0.60,
                                    height: size.height * 0.30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "${widget.data['img'][index]}"),
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
                          count: widget.data['img'].length,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              '${widget.data['name']}'
                                  .text
                                  .white
                                  .size(24)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                              '${widget.data['role']}'
                                  .text
                                  .white
                                  .align(TextAlign.center)
                                  .make()
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),

                  20.heightBox,
                  TabBar(
                    indicatorColor: Colors.green,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue,
                    ),
                    splashBorderRadius: BorderRadius.circular(50),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                    tabs: [
                      Tab(
                        child: 'About'.text.white.make(),
                      ),
                      Tab(
                        child: 'Animeography'.text.white.make(),
                      ),
                      Tab(
                        child: 'Voice Actor'.text.white.make(),
                      ),
                    ],
                  ),
                  20.heightBox,
                  // Expanded(
                  SizedBox(
                    height: size.height * 1.8,
                    child: TabBarView(
                      children: [
                        aboutCast(),
                        animeography(),
                        voiceActors(),
                      ],
                    ),
                  ),
                  // )
                ],
              ),
            ),
          )),
    );
  }
}
