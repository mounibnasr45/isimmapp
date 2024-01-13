import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Student extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String nom;

  @HiveField(2)
  late double note;

  @HiveField(3)
  late int nbAbsent;

  @HiveField(4)
  late bool abs;

  Student({
    required this.id,
    required this.nom,
    required this.note,
    required this.nbAbsent,
    required this.abs,
  });

  // Factory constructor for creating a Student from a Map
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      nom: map['nom'] as String,
      note: map['note'] as double,
      nbAbsent: map['nbAbsent'] as int,
      abs: map['abs'] as bool,
    );
  }

  // Method to convert a Student to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'note': note,
      'nbAbsent': nbAbsent,
      'abs': abs,
    };
  }

  // Method to add a new student to the database
  static Future<void> addStudent(Student student) async {
    var studentsBox = await Hive.openBox<Student>('students');
    studentsBox.add(student);
  }

  // Method to retrieve all students from the database
  static Future<List<Student>> getAllStudents() async {
    var studentsBox = await Hive.openBox<Student>('students');
    return studentsBox.values.toList();
  }

  // Method to update the number of absences for a student
  static Future<void> updateAbsences(int studentId, int newAbsences) async {
    var studentsBox = await Hive.openBox<Student>('students');
    var student = studentsBox.get(studentId);
    if (student != null) {
      student.nbAbsent = newAbsences;
      student.save(); // Save the changes
    }
  }

  // Method to delete a student from the database
  static Future<void> deleteStudent(int studentId) async {
    var studentsBox = await Hive.openBox<Student>('students');
    studentsBox.delete(studentId);
  }
}

@HiveType(typeId: 1)
class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 1;

  @override
  Student read(BinaryReader reader) {
    final id = reader.readInt();
    final nom = reader.readString();
    final note = reader.readDouble();
    final nbAbsent = reader.readInt();
    final abs = reader.readBool();

    return Student(
      id: id,
      nom: nom,
      note: note,
      nbAbsent: nbAbsent,
      abs: abs,
    );
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.nom);
    writer.writeDouble(obj.note);
    writer.writeInt(obj.nbAbsent);
    writer.writeBool(obj.abs);
  }
}
