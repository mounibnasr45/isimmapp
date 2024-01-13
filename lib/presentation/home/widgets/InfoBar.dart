import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 5, 26, 61),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Contactez-nous",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "Adress: stah jabbeur, Monastir 5000 Tunisie",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Tél : +216 70 011 920",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.fax,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Fax: +216 70 011 959",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.perm_contact_calendar,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Contact: www.isimm.rnu.tn",
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
