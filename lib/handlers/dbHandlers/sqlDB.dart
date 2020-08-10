import 'dart:io';

import 'package:path/path.dart';
import 'package:rallyreader/handlers/bookModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBase {
  DataBase._();
  static final DataBase db = DataBase._();
  Database _database;

  Future<Database> get database async {
    if (database != null) return database;
    _database = await getDataBaseInstance();
    return _database;
  }

  Future<Database> getDataBaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "BookDetails.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: ((Database db, int version) async {
        await db.execute("CREATE TABLE BookDetail ("
            "id integer primary key AUTOINCREMENT,"
            "BookName TEXT,"
            "BookImage TEXT"
            ")");
      }),
    );
  }

  saveBookDetail(BookDetail bookDetail) async {
    final db = await database;
    var raw = await db.insert(
      "BookDetails",
      bookDetail.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  Future<List<BookDetail>> getAllBookDetails() async {
    final db = await database;
    var response = await db.query("Person");
    List<BookDetail> list = response.map((c) => BookDetail.fromMap(c)).toList();
    return list;
  }
}
