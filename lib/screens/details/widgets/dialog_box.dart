import 'package:flutter/material.dart';

Widget dialogueBox({context, title, content, required Function() onpress}) {
  return AlertDialog(
    backgroundColor: Colors.grey[900],
    title: Text(
      title,
      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    ),
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'),
      ),
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        onPressed: onpress,
        child: const Text('Go'),
      ),
    ],
  );
}
