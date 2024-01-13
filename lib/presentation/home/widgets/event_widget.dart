import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  EventWidget(
      {super.key,
      required this.url,
      required this.eventname,
      required this.date,
      required this.place});
  String url = '', eventname = '', date = '', place = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                const Color.fromARGB(255, 0, 0, 0), // Couleur du bord inférieur
            width: 1,
            // Largeur du bord inférieur
          ),
        ),
        // Ajout du bord arrondi
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    -1,
                    1,
                  ),
                  blurRadius: 15,
                  spreadRadius: 3,
                )
              ],
              borderRadius:
                  BorderRadius.circular(30.0), // Ajout du bord arrondi
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  30.0), // Ajustez le rayon de la bordure ici
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventname,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  place,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
