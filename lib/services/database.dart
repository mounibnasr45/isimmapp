import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:isimm_app2/presentation/home/view/HomeView.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  // Utilisation de 'late' ici
  late Database _db;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<void> init() async {
    _db = await _initDb();
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    await init(); // Assurez-vous d'appeler init avant d'accéder à la base de données
    return _db;
  }

  Future<Database> _initDb() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'my_database.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE my_table (
            _id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  Future<int> insertData(Map<String, dynamic> data) async {
    Database db = await this.db;
    return await db.insert('my_table', data);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database db = await this.db;
    return await db.query('my_table');
  }

  // Future<void> addClasse(Classe1 classe) async {
  //   final db = await this.db;
  //   await db.insert('my_table', classe.toMap());
  // }
}
