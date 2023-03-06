import 'package:anime_app/screens/cast/widgets/cast_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CastScreen extends StatelessWidget {
  const CastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/loffyshare.png'),
                  ),
                  20.heightBox,
                  'Monkey D. Luffy'.text.white.xl4.make(),
                  10.heightBox,
                  'Main Character'.text.white.xl2.make(),
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
