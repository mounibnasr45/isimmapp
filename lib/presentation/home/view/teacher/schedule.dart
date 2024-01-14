import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/seance.dart';
import '../../../resources/routes_manager.dart';

class Cell extends StatelessWidget {
  Cell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<seance> L = [
      seance(
          matiere: 'Algo', heure: 'L1INfo', salle: 'Monday 8:30-10:00    A20'),
      seance(
          matiere: 'Algo', heure: 'L2SE', salle: 'Monday 10:30-12:00    A21'),
      seance(
          matiere: 'Algo', heure: 'CPI1', salle: 'Tuesday 14:00-15:30    A26'),
      seance(matiere: 'Algo', heure: 'CPI2', salle: 'Friday 8:30-10:00    B12'),
      seance(
          matiere: 'Algo', heure: 'L1Info', salle: 'Friday 10:30-12:00    C30'),
      seance(
          matiere: 'Algo',
          heure: 'L1INFO',
          salle: 'saturday 8:30-10:00    C20'),
    ];

    return SingleChildScrollView(
      child: Container(
        height: 900,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: MyAppBar1(),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text("A Screen meant for professors !",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 61, 5, 20),
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/images/professorlogo.webp")),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Professor: SALAH BEN YOUSSEF",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "ID: 09727513",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Your Schedule:",
                style: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 156, 16, 16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            WeekDayView(
              taskCardColor: const Color.fromARGB(255, 26, 43, 72),
              taskTitleColor: Colors.white,
              taskSubtitleColor: Colors.blueAccent,
              seanceList: L,
            ),
          ],
        ),
      ),
    );
  }
}

// class Task {
//   final DateTime date;
//   final String title;
//   final String subtitle;

//   Task({
//     required this.date,
//     required this.title,
//     required this.subtitle,
//   });
// }

class WeekDayView extends StatelessWidget {
  final Color taskCardColor;
  final Color taskTitleColor;
  final Color taskSubtitleColor;
  final List<seance> seanceList;

  WeekDayView({
    required this.taskCardColor,
    required this.taskTitleColor,
    required this.taskSubtitleColor,
    required this.seanceList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: seanceList.length,
        itemBuilder: (context, index) {
          seance currentSeance = seanceList[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.classAbsent);
            },
            child: Card(
              color: taskCardColor,
              child: ListTile(
                title: Text(
                  currentSeance.matiere,
                  style:
                      TextStyle(color: const Color.fromARGB(255, 183, 43, 33)),
                ),
                subtitle: Text(
                  currentSeance.heure,
                  style: TextStyle(color: taskSubtitleColor),
                ),
                trailing: Text(
                  currentSeance.salle,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyAppBar1 extends StatelessWidget {
  MyAppBar1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      //toolbarHeight: 90.0,
      title: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        // height: 100,
        // width: double.infinity,
        width: double.infinity,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.teachView);
                },
                icon: Icon(Icons.arrow_back)),
            Container(
              height: 50,
              width: 50,
              child: Image.asset(
                "assets/images/raslogo.png",
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "ISIMM",
              style: TextStyle(
                  fontFamily: "RobotoSlab-VariableFont_wght",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            // Profile(
            //   userName: "mounib_nasr",
            //   // height: 70,
            //   // width: 75,
            // ),
          ],
        ),
      ),
    );
  }
}
