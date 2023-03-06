import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget voiceActors() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
    ),
    itemBuilder: (context, index) {
      return ListTile(
        leading: const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/loffyshare.png'),
        ),
        title: 'Tanaka, Mayumi'.text.white.make(),
        subtitle: 'Japanese'.text.white.make(),
      );
    },
  );
}
