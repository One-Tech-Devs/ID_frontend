import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../constants/db_table_const.dart';
import '../../../models/transaction_model.dart';

typedef NotifyMockRepositoryOnGetUpdatedList = void Function(
    List<TransactionModel>);

class NotifyMockRepository {
  static Future<TransactionModel> addTransaction(
      TransactionModel transactionModel) async {
    DocumentReference documentReference = await FirebaseFirestore.instance
        .collection(REQUEST_COLLECTION)
        .add(transactionModel.toJson());

    transactionModel.id = documentReference.id;
    return transactionModel;
  }

  static Future<void> update(TransactionModel transactionModel) async {
    await FirebaseFirestore.instance
        .collection(REQUEST_COLLECTION)
        .doc(transactionModel.id)
        .update(transactionModel.toJson());
  }

  static Future<TransactionModel> getTransaction(String transactionId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(REQUEST_COLLECTION)
        .doc(transactionId)
        .get();

    return TransactionModel.fromJson(
        documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);
  }

  static void listenList(
      NotifyMockRepositoryOnGetUpdatedList onGetUpdatedList) {
    FirebaseFirestore.instance
        .collection(REQUEST_COLLECTION)
        .snapshots()
        .listen((event) {
      List<TransactionModel> list = [];
      try {
        event.docs.forEach((element) {
          var result = TransactionModel.fromJson(element.data(), element.id);
          list.add(result);
        });
        onGetUpdatedList(list);
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
