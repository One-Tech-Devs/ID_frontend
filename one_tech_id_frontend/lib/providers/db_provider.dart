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
        await db.execute(_user);
        await db.execute(_address);
      },
    );
  }

  String get _user => "CREATE TABLE ${USER_DATA_TABLE}("
      "${USER_FIELD_ID} INTEGER PRIMARY KEY,"
      "${USER_FIELD_NAME} VARCHAR(100),"
      "${USER_FIELD_SOCIAL_NAME} VARCHAR(10),"
      "${USER_FIELD_EMAIL} VARCHAR(100),"
      "${USER_FIELD_PHONE} VARCHAR(200),"
      "${USER_FIELD_CPF} VARCHAR(50),"
      "${USER_FIELD_RG} VARCHAR(50),"
      "${USER_FIELD_PIS} VARCHAR(200),"
      "${USER_FIELD_ADDRESS} VARCHAR(120))";

  String get _address => "CREATE TABLE ${ADDRESS_DATA_TABLE}("
      "${ADDRESS_FIELD_ID} INTEGER PRIMARY KEY,"
      "${ADDRESS_FIELD_STREET} VARCHAR(100),"
      "${ADDRESS_FIELD_NUMBER} VARCHAR(10),"
      "${ADDRESS_FIELD_NEIGHBORHOOD} VARCHAR(100),"
      "${ADDRESS_FIELD_CITY} VARCHAR(200),"
      "${ADDRESS_FIELD_STATE} VARCHAR(200),"
      "${ADDRESS_FIELD_COUNTRY} VARCHAR(120),"
      "${ADDRESS_FIELD_ZIP} VARCHAR(15))";
}
