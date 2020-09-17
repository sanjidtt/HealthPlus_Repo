//import 'dart:io';
//
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqflite.dart';
//
//class Databasehelper {
//  // database name
//  static final _databasename = "health.db";
//  static final _databaseversion = 1;
//
//  // the table Customers
//  static final table1 = "CUSTOMERS";
//
//  // column names of Customers
//  static final column1ID = 'C_ID';
//  static final column1Name = "NAME";
//  static final column1Gender = "GENDER";
//  static final column1Age = 'AGE';
//  static final column1Weight = 'WEIGHT';
//  static final column1Height = 'HEIGHT';
//
//  // the table Goal
//  static final table2 = "GOAL";
//
//  // column names of Goal
//  static final column2ID = 'C_ID';
//  static final column2Steps = "GOAL_STEP";
//  static final column2Water = "GOAL_WATER";
//  static final column2Diet = 'GOAL_DIET';
//  static final column2Sleep = 'GOAL_SLEEP';
//
//  // the table Steps
//  static final table3 = "STEPS";
//
//  // column names of Steps
//  static final column3ID = 'C_ID';
//  static final column3Steps = "STEPS_STEP";
//  static final column3Date = 'STEPS_DATE';
//
//  // the table Diet
//  static final table4 = "DIET";
//
//  // column names of Diet
//  static final column4ID = 'C_ID';
//  static final column4Diet = "DIET_DIET";
//  static final column4Date = 'DIET_DATE';
//
//  // the table Water
//  static final table5 = "WATER";
//
//  // column names of Water
//  static final column5ID = 'C_ID';
//  static final column5Water = "WATER_WATER";
//  static final column5Date = 'WATER_DATE';
//
//  // the table Sleep
//  static final table6 = "SLEEP";
//
//  // column names of Sleep
//  static final column6ID = 'C_ID';
//  static final column6Sleep = "SLEEP_SLEEP";
//  static final column6Date = 'SLEEP_DATE';
//
//  // a database
//  static Database _database;
//
//  // privateconstructor
//  Databasehelper._privateConstructor();
//  static final Databasehelper instance = Databasehelper._privateConstructor();
//
//  // asking for a database
//  Future<Database> get databse async {
//    if (_database != null) return _database;
//
//    // create a database if one doesn't exist
//    _database = await _initDatabase();
//    return _database;
//  }
//
//  // function to return a database
//  _initDatabase() async {
//    Directory documentdirecoty = await getApplicationDocumentsDirectory();
//    String path = join(documentdirecoty.path, _databasename);
//    return await openDatabase(path,
//        version: _databaseversion, onCreate: _onCreate);
//  }
//
//  // create a database since it doesn't exist
//  Future _onCreate(Database db, int version) async {
//    // sql code
//    await db.execute('''
//      CREATE TABLE $table1 (
//        $column1ID INTEGER PRIMARY KEY,
//        $column1Name TEXT NOT NULL,
//        $column1Gender TEXT NOT NULL,
//        $column1Age INTEGER NOT NULL,
//        $column1Weight INTEGER NOT NULL,
//        $column1Height INTEGER NOT NULL,
//      )
//      ''');
//  }
//
//  // functions to insert data
//  Future<int> insert(Map<String, dynamic> row) async {
//    Database db = await instance.databse;
//    return await db.insert(table, row);
//  }
//
//  // function to query all the rows
//  Future<List<Map<String, dynamic>>> queryall() async {
//    Database db = await instance.databse;
//    return await db.query(table);
//  }
//
//  // function to queryspecific
//  Future<List<Map<String, dynamic>>> queryspecific(int age) async {
//    Database db = await instance.databse;
//    // var res = await db.query(table, where: "age < ?", whereArgs: [age]);
//    var res = await db.rawQuery('SELECT * FROM my_table WHERE age >?', [age]);
//    return res;
//  }
//
//  // function to delete some data
//  Future<int> deletedata(int id) async {
//    Database db = await instance.databse;
//    var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
//    return res;
//  }
//
//  // function to update some data
//  Future<int> update(int id) async {
//    Database db = await instance.databse;
//    var res = await db.update(table, {"name": "Desi Programmer", "age": 2},
//        where: "id = ?", whereArgs: [id]);
//    return res;
//  }
//}
