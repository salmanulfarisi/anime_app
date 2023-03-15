import 'package:flutter/material.dart';

Widget customTextField({
  controller,
  hint,
  isstory = false,
  maxlines = 10,
  keyboardtype = TextInputType.text,
  onchanged,
  suffix,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardtype,
    maxLines: isstory ? maxlines : 1,
    style: const TextStyle(color: Colors.white),
    onChanged: onchanged,
    decoration: InputDecoration(
      suffix: suffix,
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
  );
}
