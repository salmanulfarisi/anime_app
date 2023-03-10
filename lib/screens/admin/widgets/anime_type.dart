import 'package:flutter/material.dart';

Widget animeType({context, onpress, icon, label, bool? isSelected}) {
  final size = MediaQuery.of(context).size;
  return Container(
    height: size.height * 0.1,
    width: size.width * 0.3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: OutlinedButton.icon(
      style: isSelected == false
          ? OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )
          : OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.green),
              foregroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
      onPressed: onpress,
      icon: Icon(icon),
      label: Text(label),
    ),
  );
}
