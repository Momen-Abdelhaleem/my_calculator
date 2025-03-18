import 'package:flutter/material.dart';

Widget calculatorButton({
  required Color color,
  required void Function() onPressed,
  required String text,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: color, foregroundColor: Colors.white),
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
