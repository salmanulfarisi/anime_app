import 'package:anime_app/screens/cast/widgets/cast_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget actingRoles({context, data, required index}) {
  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return actingRolesContainer(
        context: context,
        img: data['acting_roles'][index]['animeImg'],
        charImg: data['acting_roles'][index]['charImg'],
        charName: data['acting_roles'][index]['char_name'],
        charRole: data['acting_roles'][index]['char_role'],
        animeName: data['acting_roles'][index]['animeName'],
        animeRole: data['acting_roles'][index]['anime_type'],
      );
    },
    separatorBuilder: (context, index) {
      return 10.heightBox;
    },
    itemCount: data['acting_roles'].length,
  );
}
