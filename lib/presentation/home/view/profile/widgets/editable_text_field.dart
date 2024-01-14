import 'package:flutter/material.dart';

class EditableItem extends StatelessWidget {
  final String label;
  final int index0;
  final String defaultText;
  TextEditingController controller;
  EditableItem(
      {required this.label,
      required this.index0,
      required this.controller,
      this.defaultText = "",
      Key? key})
      : super(key: key) {
    // Set the default text when the controller is initialized
    controller.text = defaultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 148, 198, 221),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 7),
      child: Row(
        children: [
          SizedBox(width: 30),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
              ),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
