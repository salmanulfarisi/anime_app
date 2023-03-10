import 'package:anime_app/screens/admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            10.heightBox,
            adminTextformField(
              hint: "character Image Url",
            ),
            10.heightBox,
            adminTextformField(hint: "character Name"),
            10.heightBox,
            adminTextformField(hint: "character Role"),
            10.heightBox,
            adminTextformField(hint: "Actor Image Url"),
            10.heightBox,
            adminTextformField(hint: "Actor Name"),
            10.heightBox,
            adminTextformField(hint: "Actor Place"),
            10.heightBox,
            ElevatedButton(
              onPressed: () {},
              child: "Add".text.make(),
            ),
          ],
        ),
      ),
    );
  }
}
