//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DegreeItem extends StatefulWidget {
  DegreeItem({super.key, required this.nom, required this.url1});
  String nom;
  String url1 = "assets/images/computer_sc.jpg";

  @override
  State<DegreeItem> createState() => _DegreeItemState();
}

class _DegreeItemState extends State<DegreeItem> {
  String get url1 => widget.url1;

  String get nom => widget.nom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 285,
        color: const Color.fromARGB(255, 128, 160, 176),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  url1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      nom,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "READ MORE",
                      style: TextStyle(
                          color: Color.fromARGB(255, 108, 20, 14),
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_sharp),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
