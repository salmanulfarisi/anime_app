import 'package:anime_app/screens/admin/addAnime/add_anime.dart';
import 'package:anime_app/screens/admin/details/anime_details.dart';
import 'package:anime_app/screens/admin/main/trending.dart';
import 'package:anime_app/screens/admin/main/widgets/anime_container.dart';
import 'package:anime_app/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MainAdminPanel extends StatelessWidget {
  const MainAdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: 'Admin Panel'
                  .text
                  .white
                  .xl3
                  .fontWeight(FontWeight.bold)
                  .make(),
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              title: 'Home'.text.white.make(),
            ),
            ListTile(
              onTap: () {
                Get.back();
                Get.to(() => const TrendingAnime());
              },
              title: 'Trending Anime'.text.white.make(),
            ),
            ListTile(
              onTap: () {
                Get.back();
                Get.to(() => const AddAnime());
              },
              title: 'Add Anime'.text.white.make(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "All Anime".text.white.xl3.fontWeight(FontWeight.bold).make(),
              10.heightBox,
              StreamBuilder(
                stream: FireStoreServices.getAnimeDetails(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    var data = snapshot.data!.docs;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => AnimeDetailsAdmin(data: data[index]));
                          },
                          child: animeContainer(
                            animeEp:
                                data[index]['episodes']['totalEpisodes'] ?? '?',
                            animeImg: data[index]['animeImage'][0],
                            animename: data[index]['animeName'],
                            animeType: data[index]['animeType'],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddAnime());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
