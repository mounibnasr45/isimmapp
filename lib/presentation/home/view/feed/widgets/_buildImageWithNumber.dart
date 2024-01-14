import 'dart:async';

import 'package:flutter/material.dart';

class BuildImageWithNumber extends StatefulWidget {
  final String imagePath;
  final int number;
  final String titre;

  BuildImageWithNumber({
    Key? key,
    // required this.currentNumber,
    required this.imagePath,
    required this.number,
    required this.titre,
  }) : super(key: key);

  @override
  State<BuildImageWithNumber> createState() => _BuildImageWithNumberState();
}

class _BuildImageWithNumberState extends State<BuildImageWithNumber> {
  int currentNumber = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        if (currentNumber != widget.number) {
          setState(() {
            currentNumber++;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          color: Color.fromARGB(39, 0, 0, 0),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            widget.imagePath,
            color: Color.fromARGB(255, 9, 109, 129),
            height: 60,
            width: 55,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "+" + currentNumber.toString(),
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.titre,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
