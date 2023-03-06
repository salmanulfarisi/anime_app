import 'package:anime_app/screens/cast/widgets/cast_widgets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget actingRoles({context}) {
  return ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return actingRolesContainer(context: context);
    },
    separatorBuilder: (context, index) {
      return 10.heightBox;
    },
    itemCount: 5,
  );
}
