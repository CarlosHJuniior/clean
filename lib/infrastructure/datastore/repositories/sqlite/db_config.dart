import 'dart:async';

import 'package:clean/utils/mapping_db.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  static Database? _db;

  static Future<Database> db() async {
    var path = await getDatabasesPath();

    if (_db == null) {
      _db = await openDatabase('$path/clean.db', onCreate: _onCreate);
    }

    if (_db == null) {
      throw Exception('error starting database');
    }

    return _db!;
  }

  static Future<FutureOr<void>> _onCreate(Database db, int version) async {
    // language=sql
    await db.execute('''
      CREATE TABLE ${DBConstants.todoTableName} (
        id INTEGER PRIMARY KEY,
        ${DBConstants.todoName} TEXT NOT NULL,
        ${DBConstants.todoValue} INTEGER NOT NULL
      )
    ''');
  }
}
