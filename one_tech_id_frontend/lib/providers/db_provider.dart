// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/db_table_const.dart';

class DBProvider {
  static final DBProvider _instace = DBProvider.internal();

  factory DBProvider() => _instace;

  DBProvider.internal();

  Database? _db;
  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB();

    return _db!;
  }

  Future<Database> _initDB() async {
    String dirPath = await getDatabasesPath();
    String dbPath = join(dirPath, "onetechDataManager.db");

    log(dbPath);

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE ${USER_DATA_TABLE}("
            "${USER_FIELD_ID} INTEGER PRIMARY KEY,"
            "${USER_FIELD_NAME} VARCHAR(100),"
            "${USER_FIELD_SOCIAL_NAME} VARCHAR(100),"
            "${USER_FIELD_CPF} INTEGER,"
            "${USER_FIELD_RG} INTEGER,"
            "${USER_FIELD_ADDRESS} VARCHAR(200),"
            "${USER_FIELD_EMAIL} VARCHAR(120),"
            "${USER_FIELD_PHONE} INTEGER)");
      },
    );
  }
}
