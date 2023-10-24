import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../constants/db_table_const.dart';
import '../../../models/transaction_model.dart';

class NotifyMockRepository {
  static Future<TransactionModel> addTransaction(
      TransactionModel transactionModel) async {
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection(REQUESTER)
        .add(transactionModel.toJson());

    transactionModel.id = documentReference.id;
    return transactionModel;
  }

  static Future<TransactionModel> getTransaction(String transactionId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(REQUESTER)
        .doc(transactionId)
        .get();

    return TransactionModel.fromJson(
        documentSnapshot.data as Map<String, dynamic>, documentSnapshot.id);
  }
}
