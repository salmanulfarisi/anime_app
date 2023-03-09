import 'package:anime_app/screens/details/widgets/details_widget.dart';
import 'package:flutter/material.dart';

Widget actorAbout(
    {required BuildContext context,
    required dynamic data,
    required int index}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        rowText(title: 'Blood type :', subtitle: data['blood_type']),
        rowText(title: 'Birth place :', subtitle: data['birth_place']),
        rowText(title: 'Birth name :', subtitle: data['birth_name'] ?? '?'),
        rowText(
            title: 'Skills&Abilities :',
            subtitle: data['skill_abilities'][0] ?? '?'),
        rowText(title: 'Profile :', subtitle: data['profile'] ?? '?'),
      ],
    ),
  );
}
