import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../../resources/routes_manager.dart';
import '../../teacher/teacherview.dart';
import '../../chaptre/view/chaptreview.dart';
import '../../studentlife/StudentLife.dart';
import '../widgets/InfoBar.dart';
import '../widgets/ListEvents.dart';

import '..//widgets/navbar.dart';
import '../widgets/actualite_item.dart';
import '../widgets/degree_item.dart';
import '../widgets/degree_item1.dart';
import '../widgets/profile.dart';
import '../widgets/welcome.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Nouscontact.dart';
import '_buildImageWithNumber.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<Widget> pages = [
    FeedPage(key: PageStorageKey('FeedPage')),
    StudentLife(),
    TeacherView(),
    Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Text('page 4 '),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      //endDrawer: NavBar(),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i;
          _pageController.jumpToPage(i);
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.blue,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.school),
            title: Text("Student"),
            selectedColor: Colors.blue,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.note_add),
            title: Text("Professor"),
            selectedColor: Colors.blue,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
      body: PageView(
          children: pages,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      //toolbarHeight: 900.0,
      title: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        // height: 100,
        // width: double.infinity,
        width: double.infinity,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 33,
              margin: EdgeInsets.only(left: 15),
              //width: 120,
              child: Row(
                children: [
                  Text(
                    "ISI",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/images/newlogo.png",
                    //fit: BoxFit.contain,
                  ),
                  Text(
                    "M",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   child: Image.asset(
            //     "assets/images/raslogo.png",
            //   ),
            // ),
            // SizedBox(
            //   width: 6,
            // ),
            // Text(
            //   "ISIMM",
            //   style: TextStyle(
            //       fontFamily: "RobotoSlab-VariableFont_wght",
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold),
            // ),
            Spacer(),
            // Profile(
            //   userName: "mounib_nasr",
            //   // height: 70,
            //   // width: 75,
            // ),
            Column(
              children: [
                Container(
                    height: 45,
                    width: 45,
                    color: Colors.black,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.profile);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            18), // Appliquer le même rayon ici
                        child: Image.asset(
                          "assets/images/monicca.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Text(
                  "Monicca",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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

          // Welcom Hello
          children: [
            // WelcomeImages(),
            // Divider(
            //   color: const Color.fromARGB(255, 0, 0, 0),
            //   height: 1,
            // ),
            // UpComingEvents(),
            // Degrees(programsData: progrdamsData),
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
                    //color: Color.fromARGB(255, 162, 6, 6),
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
                    //width: 200,
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
                    //width: 240,
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
            //ActualiteItem(),
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
                  //right: 0,
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
                    //  width: 250,
                    //  height: 400,
                    // Adjust this value as needed
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
            //  Container(
            //    margin: EdgeInsets.only(left: 20, right: 20),
            //    child: LayoutBuilder(
            //      builder: (BuildContext context, BoxConstraints constraints) {
            //        return ListView.builder(
            //          scrollDirection: Axis.horizontal,
            //          itemCount: ActuItem.length,
            //          itemBuilder: (BuildContext context, int index) {
            //            return Container(
            //              width: constraints.maxWidth / 2, // Adjust this value as needed
            //              child: ActualiteItem(
            //                name: ActuItem[index]['name'],
            //                date: ActuItem[index]['Date'],
            //                place: ActuItem[index]['Place'],
            //                image: ActuItem[index]['Image'],
            //              ),
            //            );
            //          },
            //        );
            //      },
            //    ),
            //  ),
            // Container(
            //   width: double.infinity,
            //   color: Color.fromARGB(255, 5, 26, 61),
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: 70,
            //       ),
            //       Text(
            //         "International Bachelor's degree programmes ",
            //         style: Theme.of(context)
            //             .textTheme
            //             .titleLarge!
            //             .copyWith(fontSize: 18, color: Colors.white),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       // Expanded(
            //       //   child:
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             width: 30,
            //           ),
            //           // Text(
            //           //   "Exceptionel Education      Added Value",
            //           //   style: TextStyle(
            //           //     fontSize: 16,
            //           //     color: Colors.white,
            //           //     fontWeight: FontWeight.w200,
            //           //   ),
            //           // ),
            //         ],
            //       ),
            //       //)
            //       SizedBox(
            //         height: 10,
            //       ),
            //       DegreeItem1(
            //         title: "Ingénieurs",
            //         description:
            //             "La réussite au concours national d'accès aux formations d'ingénieurs ouvert aux candidats ayant accompli 2 années d'études supérieures dans un institut préparatoire dans l'une des filières mathématiques et physique (MP), physique et chimie (PC) ou technologie (T)",
            //       ),

            //       DegreeItem1(
            //         title: "Mastère Professionnel",
            //         description:
            //             "La vocation première de SUP’COM est de former des ingénieurs en Télécommunication. Cependant, SUP’COM offre aussi deux mastères M2",
            //       ),

            //       DegreeItem1(
            //         title: "Mastère de Recherche",
            //         description:
            //             "La vocation première de SUP’COM est de former des ingénieurs en Télécommunication. Cependant, SUP’COM offre aussi deux mastères M2",
            //       ),
            //     ],
            //   ),
            // ),
            Nouscontact(),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 5,
            ),
            Container(
                //height: 70,
                child: Image.asset(
              "assets/images/isimm_map.png",
              fit: BoxFit.cover,
            )),
            InfoBar(),

            // Row(
            //   children: [
            //     Container(
            //         height: 70,
            //         child: Image.asset(
            //           "assets/images/ministere.jpg",
            //           fit: BoxFit.cover,
            //         )),
            //     SizedBox(
            //       width: 20,
            //     ),
            //   ],
            // )
          ],

          // upComming events
        ),
      ),
    );
  }
}

class Degrees extends StatelessWidget {
  const Degrees({
    super.key,
    required this.programsData,
  });

  final List<Map<String, dynamic>> programsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "International Bachelor's degree programmes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Want to become an expert in education or social sciences, and path your way to Master's degree studies? ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          ...(programsData
              .map((e) => DegreeItem(nom: e['name'], url1: e['image']))
              .toList())
        ],
      ),
    );
  }
}

class UpComingEvents extends StatelessWidget {
  const UpComingEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.blue,
                  Color.fromARGB(255, 58, 156, 236),
                ])),
          ),
          Positioned(top: 80, child: ListEvents()),
          Positioned(
            top: 10,
            left: 15,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Events',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18, color: Colors.white),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'View all >>',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 128, 24, 16),
                          fontSize: 16),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/************************************** */
/************************************** */
/************************************** */
/************************************** */
/************************************** */
/************************************** */
/*import 'package:flutter/material.dart';
import '../../../services/database.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;

void main() async {
  // Explicitly initialize sqflite_common_ffi
  sqflite_ffi.sqfliteFfiInit();

  // Initialize the database
  await DatabaseHelper().init();

  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Classe Management')),
        body: Classes(),
      ),
    );
  }
}

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  DatabaseHelper dbHelper = DatabaseHelper();
  TextEditingController _classNameController = TextEditingController();
  TextEditingController _etudiantController = TextEditingController();
  TextEditingController _nbAbsentController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    // Libérer les contrôleurs de texte
    _classNameController.dispose();
    _etudiantController.dispose();
    _nbAbsentController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _classNameController,
          decoration: InputDecoration(labelText: 'Class Name'),
        ),
        TextField(
          controller: _etudiantController,
          decoration: InputDecoration(labelText: 'Etudiant'),
        ),
        TextField(
          controller: _nbAbsentController,
          decoration: InputDecoration(labelText: 'Nb Absents'),
        ),
        TextField(
          controller: _noteController,
          decoration: InputDecoration(labelText: 'Note'),
        ),
        TextButton(
          onPressed: () async {
            try {
              await dbHelper.addClasse(
                Classe1(
                  class_name: _classNameController.text,
                  etudiant: _etudiantController.text,
                  nb_absent: int.parse(_nbAbsentController.text),
                  note: double.parse(_noteController.text),
                ),
              );
            } catch (e) {
              // Gérer les erreurs de format lors du parsing
              print("Erreur lors de la conversion : $e");
            }
          },
          child: Text('Add Classe'),
        ),
      ],
    );
  }
}

class Classe1 {
  int id = 0;
  String class_name;
  String etudiant;
  int nb_absent;
  double note;

  Classe1(
      {required this.class_name,
      required this.etudiant,
      required this.nb_absent,
      required this.note});

  Map<String, dynamic> toMap() {
    return {
      'class_name': class_name,
      'etudiant': etudiant,
      'nb_absent': nb_absent,
      'note': note,
    };
  }
}
*/
