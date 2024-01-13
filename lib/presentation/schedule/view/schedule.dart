// Import des packages nécessaires
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isimm_app2/presentation/home/view/HomeView.dart';
import 'package:time_planner/time_planner.dart';

import '../../resources/routes_manager.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({
    Key? key,
  }) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  List<TimePlannerTask> tasks = [];
  late double _scale = 1.0;
  int hours = 1;
  void _generateRandomSessions() {
    // Liste des matières
    List<String> subjects = [
      'Math',
      'Algo',
      'Français',
      'Anglais',
      'c++',
      'java'
    ];

    // Nombre total d'heures par semaine
    int totalHours = 20;

    // Générer aléatoirement des séances pour chaque matière
    while (totalHours - hours >= 0) {
      subjects.forEach((subject) {
        int salle = Random().nextInt(20);
        // Random().nextInt(4) +1; // Choisissez un nombre aléatoire d'heures entre 1 et 4

        tasks.add(
          TimePlannerTask(
            color: Color.fromARGB(255, 37, 98,
                189), // Couleur aléatoire (vous pouvez ajuster cela selon vos préférences)
            dateTime: TimePlannerDateTime(
              day: Random().nextInt(7), // Jour aléatoire de la semaine
              hour: Random().nextInt(10) + 8, // Heure aléatoire entre 6 et 23
              minutes: 0, // Minutes aléatoires
            ),
            minutesDuration: hours * 60, // Convertir les heures en minutes
            daysDuration: 1, // Chaque séance dure 1 jour
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  subject,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Cours ${hours}h',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'A${salle}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
        totalHours -= hours; // Mettez à jour le nombre total d'heures restantes
      });
    }

    // Mettez à jour l'interface utilisateur
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _generateRandomSessions(); // Générez les séances aléatoires au lancement de l'application
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                       Navigator.pushReplacementNamed(context, Routes.student);
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Groupe TD:ING1_INFO_TD2 ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "a partir 15/02/2024 ",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Color.fromARGB(255, 175, 11, 11)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 500,
              height: 590,
              child: Center(
                child: GestureDetector(
                  onScaleStart: (details) {
                    _scale = 1.0;
                  },
                  onScaleUpdate: (details) {
                    setState(() {
                      _scale = details.scale;
                    });
                  },
                  onScaleEnd: (details) {
                    // Handle any cleanup after scaling ends
                  },
                  child: Transform.scale(
                    scale: _scale,
                    child: TimePlanner(
                      startHour: 8,
                      endHour: 18,
                      use24HourFormat: false,
                      setTimeOnAxis: false,
                      style: TimePlannerStyle(
                        showScrollBar: true,
                        interstitialEvenColor: Colors.grey[50],
                        interstitialOddColor: Colors.grey[200],
                      ),
                      headers: const [
                        TimePlannerTitle(
                          date: "3/11/2023",
                          title: "monday",
                        ),
                        TimePlannerTitle(
                          date: "3/11/2023",
                          title: "tuesday",
                        ),
                        TimePlannerTitle(
                          date: "3/11/2023",
                          title: "thursday",
                        ),
                        TimePlannerTitle(
                          date: "3/11/2023",
                          title: "wednesday",
                        ),
                        TimePlannerTitle(
                          date: "3/11/2023",
                          title: "friday",
                        ),
                        TimePlannerTitle(
                          date: "3/11/2023",
                          title: "saturday",
                        ),

                        // ... Ajoutez d'autres jours ici
                      ],
                      tasks: tasks,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
