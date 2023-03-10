import 'package:anime_app/screens/admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ActorsPage extends StatelessWidget {
  const ActorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: 'Actors'.text.make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              10.heightBox,
              adminTextformField(hint: "actor Image"),
              10.heightBox,
              adminTextformField(hint: "actor Name"),
              10.heightBox,
              adminTextformField(hint: "actor place"),
              10.heightBox,
              adminTextformField(hint: "actor Profile"),
              10.heightBox,
              adminTextformField(hint: "blood Type"),
              10.heightBox,
              adminTextformField(hint: "birthplace"),
              10.heightBox,
              adminTextformField(hint: "birthName"),
              10.heightBox,
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: adminTextformField(
                      hint: "skills",
                    ),
                  ),
                  10.widthBox,
                  Column(
                    children: [
                      '0 added'.text.white.make(),
                      TextButton(
                        onPressed: () {},
                        child: "Add".text.make(),
                      )
                    ],
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: "Add".text.make(),
              ),
            ],
          ),
        ));
  }
}
