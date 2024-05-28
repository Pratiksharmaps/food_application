import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class FoodProvider extends ChangeNotifier {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'food_database.db');
    return openDatabase(
      path,
     onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE selections(id INTEGER PRIMARY KEY, rice TEXT, dal TEXT)",
        );
      },
      version: 1,
    );
  }
    Future<void> saveSelection(
        {required String? selectedRice, required String? selectedDal}) async{
      final db = await database;
      try {
        final result = await db.insert(
          'selections',
          {
            'rice': selectedRice,
            'dal': selectedDal,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
         print('Data inserted with ID: $result');
      } catch (e) {
        print(e.toString());
      }
    }
  }

