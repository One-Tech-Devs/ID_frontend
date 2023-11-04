import 'package:flutter/material.dart';
import '../../../../core/data/models/transaction_model.dart';
import '../../../../core/data/repositories/mock/firebase_mock_repo/notify_firestore_repository.dart';
import 'request_details_by_id_card.dart';

class RequestDetailsCard extends StatelessWidget {
  final String? transactionModelId;
  const RequestDetailsCard({required this.transactionModelId, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NotifyMockRepository.getTransaction(transactionModelId!),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: LinearProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          TransactionModel transactionModel = snapshot.data!;
          return RequestDetails(
            transactionModel: transactionModel,
          );
        });
  }
}
