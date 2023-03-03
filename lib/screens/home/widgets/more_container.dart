import 'package:flutter/material.dart';

Widget moreContainer([context]) {
  final size = MediaQuery.of(context).size;
  return SizedBox(
    child: Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'More',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
