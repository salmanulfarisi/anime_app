import 'package:anime_app/screens/details/details.dart';
import 'package:anime_app/screens/home/widgets/home_widgets.dart';
import 'package:anime_app/services/firestore_services.dart';
import 'package:anime_app/widgets/widget_conts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: FireStoreServices.getSpotlightAnime(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return caroselShimmer(context: context);
                } else {
                  var data = snapshot.data!.docs;
                  return VxSwiper.builder(
                    autoPlay: true,
                    height: 350,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return carosalContainer(
                        context: context,
                        caroselAnimeType: data[index]['anime_type'],
                        caroselTitle: data[index]['animeName'],
                        caroselImg: data[index]['posterImg'][0],
                        caroselRanking: "#${index + 1}Spotlight",
                        caroselEpisodes: data[index]['total_episodes'] ?? '20',
                        caroselStareted: data[index]['aired']['from'],
                        caroselAnimedesc: data[index]['overview'],
                      );
                    },
                  );
                }
              },
            ),
            20.heightBox,
            'Trending'.text.xl4.color(Colors.green).bold.make(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200, // fixed height of the horizontal list
                child: StreamBuilder(
                  stream: FireStoreServices.getTrendingAnimeAsending(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var data = snapshot.data!.docs;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length, // number of items in the list
                        itemBuilder: (BuildContext context, int index) {
                          var docId = snapshot.data!.docs[index].id;

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            data: data[index],
                                            id: docId,
                                          )));
                            },
                            child: topAnime(
                                context: context,
                                index: "0${index + 1}",
                                animeName: data[index]['animeName'],
                                animeImage: data[index]['posterImg'][0]),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 10.widthBox;
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/images/loffyshare.png",
                  height: 100,
                ),
                10.widthBox,
                Positioned(
                  right: 0,
                  bottom: context.percentHeight * 4,
                  child: 'Share our\n app'
                      .text
                      .color(Colors.green)
                      .align(TextAlign.center)
                      .bold
                      .make(),
                )
              ],
            ),
            titleContainer(text: 'Top Airing'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200, // fixed height of the horizontal list
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10, // number of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    return animeContainer(context: context);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.widthBox;
                  },
                ),
              ),
            ),
            titleContainer(text: 'Most Popular'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200, // fixed height of the horizontal list
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10, // number of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    return animeContainer(context: context);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.widthBox;
                  },
                ),
              ),
            ),
            titleContainer(text: 'Completed'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200, // fixed height of the horizontal list
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10, // number of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    return animeContainer(context: context);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.widthBox;
                  },
                ),
              ),
            ),
            titleContainer(text: 'Top 10 Upcoming'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200, // fixed height of the horizontal list
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10, // number of items in the list
                  itemBuilder: (BuildContext context, int index) {
                    return animeContainer(context: context);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.widthBox;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
