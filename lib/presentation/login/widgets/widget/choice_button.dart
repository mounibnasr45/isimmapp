import 'package:flutter/material.dart';

Widget choice1_button(int selected, String nom, void func()) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        (selected == 1)
            ? Color.fromARGB(255, 47, 125, 203)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
    ),
    onPressed: func,
    child: Text(
      nom,
      style: TextStyle(
          color: (selected == 1)
              ? Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 0, 0, 0)),
    ),
  );
}
