import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/InfoBar.dart';
import '../widgets/Nouscontact.dart';
import '../widgets/_buildImageWithNumber.dart';
import '../widgets/actualite_item.dart';

class FeedPage extends StatefulWidget {
  FeedPage({
    super.key,
  });

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> progrdamsData = [
    {
      'name': "Bachelor's Degree Programme in Computer Science",
      'image': "assets/images/computer_sc.jpg",
    },
    {
      'name': "Bachelor's Degree Programme in Embedded Systems",
      'image': "assets/images/embedded_system.jpg",
    },
    {
      'name': "Bachelor's Degree Programme in Embedded Systems",
      'image': "assets/images/cpi.jpg",
    },
    {
      'name': "integrated preparatory cycle",
      'image': "assets/images/cpi.jpg",
    },
  ];
  final List<Map<String, dynamic>> ActuItem = [
    {
      'name': "Hack the Future Pre-hackathon",
      'Date': " Date: 06-15-2023",
      'Place': " PolyTech Monastir",
      "Image": "assets/images/hacka3.jpg",
    },
    {
      'name': "Hack the Future Pre-hackathon",
      'Date': " Date: 06-15-2023",
      'Place': " PolyTech Monastir",
      "Image": "assets/images/hacka3.jpg",
    },
    {
      'name': "Hack the Future Pre-hackathon",
      'Date': " Date: 06-15-2023",
      'Place': " PolyTech Monastir",
      "Image": "assets/images/hacka3.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              width: double.infinity,
              height: 18,
              color: Color.fromARGB(255, 8, 79, 90),
              child: Center(
                child: Text(
                  "This app is in beta version.feel free to give us your feedback",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              color: Colors.blue,
              height: 300,
              width: double.infinity,
              child: Image.asset(
                "assets/images/isimm_build.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "Why choose ISIMM?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10, top: 12),
              child: Text(
                  "Higher Institute of Informatics and Mathematics of Monastir prides itself on the good reputation of its graduates. The school's orientation score is rising year on year, thanks to the determination of its teaching staff and the quality of its programs, which offer a judicious mix of theoretical and practical knowledge.",
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.red,
                            ),
                            Text(
                              "Diversified training",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.red,
                            ),
                            Text(
                              "Scientific research",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.red,
                            ),
                            Text(
                              "Workforce Inclusion",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.red,
                            ),
                            Text(
                              "Community life",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.red,
                            ),
                            Text(
                              "Key Allies",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.done,
                              color: Colors.red,
                            ),
                            Text(
                              "Worldwide Treaties",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 9, 109, 129),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "ISIMM IN NUMBRES",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                )),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/books.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 2.0),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BuildImageWithNumber(
                                imagePath: 'assets/images/enseigants.png',
                                number: 130,
                                titre: "Enseignants"),
                            BuildImageWithNumber(
                                imagePath: 'assets/images/enseigants.png',
                                number: 150,
                                titre: "Student"),
                            BuildImageWithNumber(
                                imagePath: 'assets/images/enseigants.png',
                                number: 63,
                                titre: "Agent"),
                            BuildImageWithNumber(
                                imagePath: 'assets/images/enseigants.png',
                                number: 6,
                                titre: "Clubs"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ActuItem.map((item) {
                  return Container(
                    child: ActualiteItem(
                      name: item['name'],
                      date: item['Date'],
                      place: item['Place'],
                      image: item['Image'],
                    ),
                  );
                }).toList(),
              ),
            ),
            Nouscontact(),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 5,
            ),
            Container(
                child: Image.asset(
              "assets/images/isimm_map.png",
              fit: BoxFit.cover,
            )),
            InfoBar(),
          ],
        ),
      ),
    );
  }
}
