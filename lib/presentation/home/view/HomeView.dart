import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../resources/routes_manager.dart';
import 'student/StudentLife.dart';
import 'teacher/teacherview.dart';
import 'feed/widgets/InfoBar.dart';
import '../widgets/ListEvents.dart';
import 'feed/pages/feed_page.dart';
import 'feed/widgets/actualite_item.dart';
import '../widgets/degree_item.dart';
import 'feed/widgets/Nouscontact.dart';
import 'feed/widgets/_buildImageWithNumber.dart';

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
