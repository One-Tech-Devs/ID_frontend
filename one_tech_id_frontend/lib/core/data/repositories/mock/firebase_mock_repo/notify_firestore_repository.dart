import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../constants/db_table_const.dart';
import '../../../models/transaction_model.dart';

typedef NotifyMockRepositoryOnGetUpdatedList = void Function(
    List<TransactionModel>);

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

  static void listenList(
      NotifyMockRepositoryOnGetUpdatedList onGetUpdatedList) {
    FirebaseFirestore.instance
        .collection(REQUEST_COLLECTION)
        .snapshots()
        .listen((event) {
      List<TransactionModel> list = [];

      try {
        event.docs.forEach((element) {
          list.add(TransactionModel.fromJson(
              element.data() as Map<String, dynamic>, element.id));
        });
      } finally {
        onGetUpdatedList(list);
      }
    });
  }
}
