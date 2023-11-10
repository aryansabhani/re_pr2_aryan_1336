import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static final DbHelper dbHelper = DbHelper._();

  final String table = 'db1';

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, table);

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Test (name TEXT, value INTEGER,des TEXT)');
    });
  }

  additem(
      {required String name, required int value, required String des}) async {
    var map = <String, Object?>{
      'name': name,
      'value': value,
      'des': des,
    };

    final Database db = await initDb();
    final id = await db.insert(table, map);
    log("$id");
    return id;
  }
}
