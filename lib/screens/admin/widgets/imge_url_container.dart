import 'package:flutter/material.dart';

Widget urlTextField({controller}) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    onFieldSubmitted: (value) {
      controller.text = value;
    },
    decoration: InputDecoration(
      hintText: 'Enter Image Url',
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
