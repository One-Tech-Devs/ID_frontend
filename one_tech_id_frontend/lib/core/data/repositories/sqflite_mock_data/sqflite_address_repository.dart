import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../../constants/db_table_const.dart';
import '../../../../providers/db_provider.dart';
import '../../models/address_model.dart';

class SQFLiteAddressRepository extends ChangeNotifier {
  static Future<void> add(AddressModel addressModel) async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;
    await db.insert(ADDRESS_DATA_TABLE, addressModel.toJson());
    log("db.insert");
  }

  static Future<void> update(AddressModel addressModel) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;

    await db.update(ADDRESS_DATA_TABLE, addressModel.toJson(),
        where: "${ADDRESS_FIELD_ID} = ? ", whereArgs: [addressModel.id]);
  }

  static Future<void> delete(AddressModel addressModel) async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;
    await db.delete(USER_DATA_TABLE,
        where: "${ADDRESS_FIELD_ID} = ?", whereArgs: [addressModel.id]);
  }

  static Future<List<AddressModel>> getAll() async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;

    var rows = await db.query(ADDRESS_DATA_TABLE);

    List<AddressModel> docs = [];
    rows.forEach((element) => docs.add(AddressModel.fromJson(element)));

    return docs;
  }

  static Future<AddressModel?> get(int id) async {
    DBProvider dbProvider = DBProvider();

    var db = await dbProvider.db;
    var rows = await db.query(USER_DATA_TABLE,
        where: "${ADDRESS_FIELD_ID} = ?", whereArgs: [id]);
    if (rows.isEmpty) return null;

    return AddressModel.fromJson(rows.first);
  }
}
