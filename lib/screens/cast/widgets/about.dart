import 'package:anime_app/screens/details/widgets/details_widget.dart';
import 'package:anime_app/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

Widget aboutCast() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        rowText(title: 'Age :', subtitle: '17,19'),
        rowText(title: 'Birthdate :', subtitle: 'May 5, Taurus'),
        rowText(title: 'Height :', subtitle: '172 cm,174 cm'),
        rowText(title: 'Blood type :', subtitle: 'F'),
        rowText(title: 'Affilation :', subtitle: 'Straw Hat Pirates'),
        rowText(title: 'Position :', subtitle: 'Captain'),
        rowText(
            title: 'Devil fruit :', subtitle: 'Gomu Gomu no Mi(Gum Gum Fruit)'),
        rowText(title: 'Type :', subtitle: 'jparamecia'),
        rowText(
            title: 'Bounty :',
            subtitle:
                '1,500,000,000(previously; 30,000,000, 100,000,000, 300,000,000, 400,000,000 and 500,000,000)'),
        30.heightBox,
        samplebio.text.white.make(),
      ],
    ),
  );
}
