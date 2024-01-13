import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Student_repository/student_repo.dart';
// Assurez-vous d'importer le package flutter/material

class Auth {
  static final _auth = FirebaseAuth.instance;

  static Future<bool> loginIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);

      return false;
    }
  }

  static Future<String> signUp({required Student1 student}) async {
    var repo = StudentRepository();
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: student.email!,
          password: student.password!); //user yakekh uid auto

      repo.createUser(student, user.user!.uid);

      return "ok";
    } on FirebaseAuthException catch (e) {
      // print(e.code);

      return e.code;
    }
  }

  void LogOut() {
    _auth.signOut();
  }
}
