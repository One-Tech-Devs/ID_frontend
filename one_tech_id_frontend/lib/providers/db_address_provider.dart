// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/db_table_const.dart';

class DBAddressProvider {
  static final DBAddressProvider _instace = DBAddressProvider.internal();

  factory DBAddressProvider() => _instace;

  DBAddressProvider.internal();

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
        await db.execute("CREATE TABLE ${ADDRESS_DATA_TABLE}("
            "${ADDRESS_FIELD_ID} INTEGER PRIMARY KEY,"
            "${ADDRESS_FIELD_STREET} VARCHAR(100),"
            "${ADDRESS_FIELD_NUMBER} VARCHAR(10),"
            "${ADDRESS_FIELD_NEIGHBORHOOD} VARCHAR(100),"
            "${ADDRESS_FIELD_CITY} VARCHAR(200),"
            "${ADDRESS_FIELD_STATE} VARCHAR(200),"
            "${ADDRESS_FIELD_COUNTRY} VARCHAR(120),"
            "${ADDRESS_FIELD_ZIP} VARCHAR(15))");
      },
    );
  }
}
