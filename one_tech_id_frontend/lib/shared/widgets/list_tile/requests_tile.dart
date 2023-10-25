import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';

class RequestsTile extends StatelessWidget {
  final TransactionModel transactionModel;
  const RequestsTile({required this.transactionModel, super.key});

  bool isExpired() {
    if (transactionModel.requestStatus == "active") return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transactionModel.requester),
      subtitle: Text("tem acesso a: ${transactionModel.requestData}"),
      trailing: Column(
        children: [
          Text(isExpired() ? "expira em" : "expirou em"),
          Text(transactionModel.requestUntil)
        ],
      ),
    );
  }
}
