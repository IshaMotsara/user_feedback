import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'feedback.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE feedback(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          email TEXT,
          contact TEXT,
          description TEXT,
          imagePath TEXT,
          videoPath TEXT,
          filePath TEXT,
          issueTitle TEXT
        )
        ''');
      },
    );
  }


  static Future<void> insertFeedback(
      Map<String, dynamic> data) async {
    final db = await database;

    await db.insert(
      'feedback',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ADD THIS AFTER insertFeedback()

  static Future<List<Map<String, dynamic>>> getAllFeedback() async {
    final db = await database;

    return await db.query('feedback');
  }
}