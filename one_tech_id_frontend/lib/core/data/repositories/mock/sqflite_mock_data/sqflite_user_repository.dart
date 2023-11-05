// ignore_for_file: unnecessary_brace_in_string_interps, avoid_function_literals_in_foreach_calls
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/user_model.dart';
import 'package:one_tech_data_control/providers/db_provider.dart';
import '../../../../../constants/db_table_const.dart';

class SQFLiteUserRepository extends ChangeNotifier {
  static Future<void> add(UserModel userModel) async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;
    await db.insert(USER_DATA_TABLE, userModel.toJson());
  }

  static Future<void> update(UserModel userModel) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;

    await db.update(USER_DATA_TABLE, userModel.toJson(),
        where: "${USER_FIELD_ID} = ? ", whereArgs: [userModel.id]);

    var query = await db.rawQuery("SELECT * FROM ${USER_DATA_TABLE}");
    log(query.toString());
  }

  static Future<void> delete(UserModel userModel) async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;
    await db.delete(USER_DATA_TABLE,
        where: "${USER_FIELD_ID} = ?", whereArgs: [userModel.id]);
  }

  static Future<List<UserModel>> getDocs() async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;

    var rows = await db.query(USER_DATA_TABLE);

    List<UserModel> docs = [];
    rows.forEach((element) => docs.add(UserModel.fromJson(element)));

    return docs;
  }

  static Future<UserModel?> get(int? id) async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;
    var rows = await db
        .query(USER_DATA_TABLE, where: "${USER_FIELD_ID} = ?", whereArgs: [id]);
    if (rows.isEmpty) return null;

    return UserModel.fromJson(rows.first);
  }

  static Future<UserModel> getLogin(String cpf, String password) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;

    try {
      var rows = await db.query(USER_DATA_TABLE,
          where: "${USER_FIELD_CPF} = ? AND ${USER_FIELD_PASSWORD} = ?",
          whereArgs: [cpf, password]);

      return UserModel.fromJson(rows.first);
    } catch (e) {
      log(e.toString());
      throw e.toString();
    }
  }
}
