import 'package:cloud_firestore/cloud_firestore.dart';


class StudentRepository {
  final _firestore = FirebaseFirestore.instance;

  createUser(Student1 student, String uid) async {
    try {
      await _firestore
          .collection('student') //collection:table :ens de doc
          .doc(uid) //ligne fe table
          .set(student.toJson());//hot contenue 
    } on FirebaseException catch (e) {
      print(e.code);
    }
  }
}

class Student1 {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Student1({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  // Convert student object to JSON
  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "lastName": lastName,
      "Email": email,
      "Password": password,
    };
  }
}
