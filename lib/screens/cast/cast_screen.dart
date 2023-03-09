import 'package:anime_app/screens/cast/widgets/char_act_container.dart';
import 'package:anime_app/screens/details/widgets/details_widget.dart';
import 'package:anime_app/utils/const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                rowText(title: 'Age :', subtitle: '17,19'),
                rowText(title: 'Birthdate :', subtitle: 'May 5, Taurus'),
                rowText(title: 'Height :', subtitle: '172 cm,174 cm'),
                rowText(title: 'Blood type :', subtitle: 'F'),
                rowText(title: 'Affilation :', subtitle: 'Straw Hat Pirates'),
                rowText(title: 'Position :', subtitle: 'Captain'),
                rowText(
                    title: 'Devil fruit :',
                    subtitle: 'Gomu Gomu no Mi(Gum Gum Fruit)'),
                rowText(title: 'Type :', subtitle: 'jparamecia'),
                rowText(
                    title: 'Bounty :',
                    subtitle:
                        '1,500,000,000(previously; 30,000,000, 100,000,000, 300,000,000, 400,000,000 and 500,000,000)'),
                30.heightBox,
                const ReadMoreText(
                  samplebio,
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
                "Animeography".text.xl3.white.make(),
                10.heightBox,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            "${widget.data['animeography'][index]['animeImg']}"),
                      ),
                      title:
                          "${widget.data['animeography'][index]['anime_name']}"
                              .text
                              .white
                              .make(),
                      subtitle:
                          "${widget.data['animeography'][index]['role']} (Role)"
                              .text
                              .white
                              .make(),
                      trailing: const Icon(LineIcons.plus, color: Colors.white),
                    );
                  },
                  itemCount: widget.data['animeography'].length,
                ),
                10.heightBox,
                "Voice Actors".text.xl3.white.make(),
                10.heightBox,
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return charActContainer(
                      img: "${widget.data['voice_actors'][index]['actorImg']}",
                      name:
                          "${widget.data['voice_actors'][index]['actor_name']}",
                      role: "${widget.data['voice_actors'][index]['place']}",
                    );
                  },
                  itemCount: widget.data['voice_actors'].length,
                )
              ],
            ),
          ),
          // )
        ),
      ),
    );
  }
}
