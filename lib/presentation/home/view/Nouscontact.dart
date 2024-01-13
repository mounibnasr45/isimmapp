import 'package:flutter/material.dart';

import '../../login/widgets/widget/log/sign_button.dart';
import '../../login/widgets/widget/textfield.dart';
import '../../resources/routes_manager.dart';

class Nouscontact extends StatefulWidget {
  const Nouscontact({super.key});

  @override
  State<Nouscontact> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Nouscontact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 15),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 101, 100, 100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Contact Us",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 18, color: Colors.white),
                ),
              )),
          Container(
            margin: EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFiled1(nom: "First_Name /Last_Name"),
                SizedBox(
                  height: 20,
                ),
                TextFiled1(nom: "Email"),
                SizedBox(
                  height: 20,
                ),
                TextFiled1(nom: "Phone Number"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Message",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Your button click logic here

                    // Appel de la fonction pour afficher la boîte de dialogue
                    _afficherBoiteDialogue(context, "Message sent");
                  },
                  child: Text(
                    "Submitted",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 9, 109, 129),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void _afficherBoiteDialogue(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blue, // Changer la couleur de fond ici
        title: Row(
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 8.0),
            Text('Message'),
          ],
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Fermer la boîte de dialogue
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
