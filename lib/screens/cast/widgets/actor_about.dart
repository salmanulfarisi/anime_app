import 'package:anime_app/screens/details/widgets/details_widget.dart';
import 'package:flutter/material.dart';

Widget actorAbout({required BuildContext context, required dynamic data}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        rowText(title: 'Hometown :', subtitle: 'Tokyo, japan'),
        rowText(title: 'Blood type :', subtitle: 'A'),
        rowText(title: 'Hobbies :', subtitle: 'theater'),
        rowText(
            title: 'Skills&Abilities :',
            subtitle:
                '-member of an early childhood education research society\n -playing with children'),
      ],
    ),
  );
}
