import 'package:flutter/material.dart';

class EmailTextFiled extends StatelessWidget {
  EmailTextFiled(
      {super.key, required this.nom, required this.textEditingController});
  String nom;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return
        //Padding(
        //padding: const EdgeInsets.all(16.0),
        //child:
        // TextField
        TextField(
      controller: textEditingController, // Attacher le contrôleur
      decoration: InputDecoration(
        labelText: nom,
        border: OutlineInputBorder(),
      ),
    );
    //);
  }

  @override
  void dispose() {
    // Libérer le contrôleur lorsque le widget est supprimé
    textEditingController.dispose();
    dispose();
  }
}

class TextFiled1 extends StatelessWidget {
   TextFiled1(
      {super.key, required this.nom, });
  String nom;
 

  @override
  Widget build(BuildContext context) {
    return
        //Padding(
        //padding: const EdgeInsets.all(16.0),
        //child:
        // TextField
        TextField(
      // Attacher le contrôleur
      decoration: InputDecoration(
        labelText: nom,
        border: OutlineInputBorder(),
      ),
    );
    //);
  }

  
}

class MdpTextFiled extends StatelessWidget {
  MdpTextFiled({super.key});

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
        //Padding(
        //padding: const EdgeInsets.all(16.0),
        //child:
        // TextField
        TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
      ),
    );
    // );
  }

  @override
  void dispose() {
    // Libérer le contrôleur lorsque le widget est supprimé
    _textEditingController.dispose();
    dispose();
  }
}
