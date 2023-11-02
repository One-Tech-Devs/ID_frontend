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
    log("db.insert");
  }

  static Future<void> update(UserModel userModel) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;

    await db.update(USER_DATA_TABLE, userModel.toJson(),
        where: "${USER_FIELD_ID} = ? ", whereArgs: [userModel.id]);
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

  static Future<UserModel?> get(int id) async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;
    var rows = await db
        .query(USER_DATA_TABLE, where: "${USER_FIELD_ID} = ?", whereArgs: [id]);
    if (rows.isEmpty) return null;

    return UserModel.fromJson(rows.first);
  }
}
