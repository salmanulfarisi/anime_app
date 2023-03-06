import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

Widget animeography() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        leading: const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/loffyshare.png'),
        ),
        title: 'One Piece'.text.white.make(),
        subtitle: 'Main Character'.text.white.make(),
        trailing: const Icon(LineIcons.plus, color: Colors.white),
      );
    },
    itemCount: 10,
  );
}
