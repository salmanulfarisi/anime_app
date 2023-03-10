import 'package:flutter/material.dart';

Widget adminTextformField(
    {hint, isDisc = false, controller, keyboardType = TextInputType.text}) {
  return TextFormField(
    keyboardType: keyboardType,
    controller: controller,
    maxLines: isDisc ? 4 : 1,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hint,
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
