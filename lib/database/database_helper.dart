import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  Database? _db;
  Database get db => _db!;

  Future<void> init() async {
    try {
      _db = await openDatabase('database.db', version: 1, onCreate: (db, version) {
        db.execute('''
          CREATE TABLE favoriteMovies (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT NOT NULL,
              overview TEXT,
              img TEXT,
              calification REAL NOT NULL,
              genres TEXT NOT NULL,
              runtime INTEGER,
              relaseDate TEXT NOT NULL
          );
        ''');
      });
    } catch (e) {
      print('Error al inicializar la base de datos: $e');
      rethrow;
    }
  }

}
