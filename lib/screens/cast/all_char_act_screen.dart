import 'package:anime_app/screens/cast/actor_screen.dart';
import 'package:anime_app/screens/cast/cast_screen.dart';
import 'package:anime_app/screens/cast/widgets/cast_widgets.dart';
import 'package:flutter/material.dart';

class AllCast extends StatelessWidget {
  final dynamic data;
  final dynamic actData;
  const AllCast({Key? key, this.data, this.actData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                  indicatorColor: Colors.green,
                  splashBorderRadius: BorderRadius.all(Radius.circular(50)),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  tabs: [
                    Tab(
                      text: 'Characters',
                    ),
                    Tab(
                      text: 'Actors',
                    ),
                  ]),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    child: GridView.builder(
                      gridDelegate:
                          (const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      )),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CastScreen(
                                          index: index,
                                          data: data[index],
                                        )));
                          },
                          child: charActContainer(
                            img: data[index]['img'][0],
                            name: data[index]['name'],
                            role: data[index]['role'],
                          ),
                        );
                      },
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate:
                        (const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    )),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VoiceActorScreen(
                                        actData: actData[index],
                                        index: index,
                                      )));
                        },
                        child: charActContainer(
                          img: actData[index]['Img'],
                          name: actData[index]['name'],
                          role: actData[index]['place'],
                        ),
                      );
                    },
                    itemCount: actData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            )
            // 'All Characters'.text.white.xl4.make(),
            // 20.heightBox,
            // GridView.builder(
            //   gridDelegate:
            //       (const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisExtent: 200,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     childAspectRatio: 0.7,
            //   )),
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => CastScreen(
            //                       index: index,
            //                       data: data[index],
            //                     )));
            //       },
            //       child: charActContainer(
            //         img: data[index]['img'][0],
            //         name: data[index]['name'],
            //         role: data[index]['role'],
            //       ),
            //     );
            //   },
            //   itemCount: data.length,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            // ),
            // 10.heightBox,
            // 'All Actors'.text.white.xl4.make(),
            // 20.heightBox,
            // GridView.builder(
            //   gridDelegate:
            //       (const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisExtent: 200,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     childAspectRatio: 0.7,
            //   )),
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => VoiceActorScreen(
            //                       actData: actData[index],
            //                       index: index,
            //                     )));
            //       },
            //       child: charActContainer(
            //         img: actData[index]['Img'],
            //         name: actData[index]['name'],
            //         role: actData[index]['place'],
            //       ),
            //     );
            //   },
            //   itemCount: actData.length,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            // ),

            ));
  }
}
