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
        await db.execute(_requests);
      },
    );
  }

  String get _user => "CREATE TABLE ${USER_DATA_TABLE}("
      "${USER_FIELD_ID} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${USER_FIELD_PASSWORD} TEXT,"
      "${USER_FIELD_SECURITY_PHRASE} TEXT,"
      "${USER_FIELD_NAME} TEXT,"
      "${USER_FIELD_SOCIAL_NAME} TEXT,"
      "${USER_FIELD_EMAIL} TEXT,"
      "${USER_FIELD_PHONE} TEXT,"
      "${USER_FIELD_CPF} TEXT,"
      "${USER_FIELD_RG} TEXT,"
      "${USER_FIELD_PIS} TEXT,"
      "${USER_FIELD_ADDRESS_ID} TEXT)";

  String get _address => "CREATE TABLE ${ADDRESS_DATA_TABLE}("
      "${ADDRESS_FIELD_ID} INTEGER PRIMARY KEY,"
      "${ADDRESS_FIELD_STREET} TEXT,"
      "${ADDRESS_FIELD_NUMBER} TEXT,"
      "${ADDRESS_FIELD_NEIGHBORHOOD} TEXT,"
      "${ADDRESS_FIELD_CITY} TEXT,"
      "${ADDRESS_FIELD_STATE} TEXT,"
      "${ADDRESS_FIELD_COUNTRY} TEXT,"
      "${ADDRESS_FIELD_ZIP} TEXT)";

  String get _requests => "CREATE TABLE ${REQUEST_DATA_TABLE}("
      "${REQUEST_FIELD_ID} INTEGER PRIMARY KEY,"
      "${REQUEST_FIELD_REQUESTER} TEXT,"
      "${REQUEST_FIELD_REQUEST_DATA} TEXT,"
      "${REQUEST_FIELD_REQUEST_DATE} TEXT,"
      "${REQUEST_FIELD_REQUEST_UNTIL} TEXT,"
      "${REQUEST_FIELD_STATUS} TEXT)";
}
