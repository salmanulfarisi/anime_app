import 'package:anime_app/screens/cast/widgets/cast_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VoiceActorScreen extends StatelessWidget {
  final dynamic actData;
  final int index;
  const VoiceActorScreen({Key? key, this.actData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("${actData['Img']}"),
                  ),
                  20.heightBox,
                  "${actData['name']}".text.white.xl4.make(),
                  10.heightBox,
                  "${actData['place']}".text.white.xl2.make(),
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
                        child: 'voice Actiong Roles'.text.white.make(),
                      ),
                    ],
                  ),
                  20.heightBox,
                  // Expanded(
                  SizedBox(
                    height: size.height * 1.8,
                    child: TabBarView(
                      children: [
                        actorAbout(context: context, data: actData[index]),
                        actingRoles(),
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
