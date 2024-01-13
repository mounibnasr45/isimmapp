import 'package:flutter/material.dart';
import 'package:isimm_app2/presentation/home/widgets/event_widget.dart';

class ListEvents extends StatelessWidget {
  ListEvents({super.key});

  List<List<String>> L = [
    [],
    [
      "assets/images/hackathon.jpg",
      "Hackathon Event",
      "10-13 December 2023",
      "Beja"
    ],
    [
      "assets/images/hacka2.jpg",
      "Robotic Event",
      "19-21 January 2024",
      "Tozeur"
    ],
    [
      "assets/images/hacka3.jpg",
      "Hackathon Event",
      "09-12 febrary 2023",
      "Gafsa"
    ],
    ["assets/images/hacka4.jpg", "AI Event", "23-24 December 2023", "kebeli"],
    []
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250, // Set a specific height for the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(width: 20);
          }
          if (index == L.length - 1) {
            return SizedBox(
              width: 20,
            );
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(30.0), // Ajout du bord arrondi
              border: Border.all(
                color: Colors.white, // Couleur de la bordure
                width: 11, // Épaisseur de la bordure (bold)
              ),
            ),
            margin: EdgeInsets.only(right: 13.0),
            //color: Color.fromARGB(255, 217, 10, 10),
            child: EventWidget(
              url: L[index][0],
              eventname: L[index][1],
              date: L[index][2],
              place: L[index][3],
            ),
          );
        },
      ),
    );
  }
}
