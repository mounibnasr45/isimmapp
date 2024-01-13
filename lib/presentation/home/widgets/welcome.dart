import 'package:flutter/material.dart';

class WelcomeImages extends StatefulWidget {
  const WelcomeImages({super.key});

  @override
  State<WelcomeImages> createState() => _WelcomeImagesState();
}

class _WelcomeImagesState extends State<WelcomeImages> {
  List<String> L = [
    "assets/images/gallerry1.jpg",
    "assets/images/gallerry2.jpg",
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Colors.blue,
            const Color.fromARGB(255, 49, 75, 96),
          ])),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Higher Institute of Informatics and Mathematics of Monastir ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSerifBalinese-Regular',
            ),
          ),
          SizedBox(height: 10),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      if (index > 0) {
                        index--;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,

                    //size: 24,
                  ),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(
                            -1,
                            1,
                          ),
                          blurRadius: 10,
                          spreadRadius: 7,
                          color: const Color.fromARGB(255, 30, 73, 109))
                    ]),
                    child: Image.asset(
                      L[index],
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (index < 1) {
                            index++;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios_sharp))),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
