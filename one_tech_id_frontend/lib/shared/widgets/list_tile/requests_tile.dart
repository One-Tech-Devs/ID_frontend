import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';

class RequestsTile extends StatelessWidget {
  final TransactionModel transactionModel;
  const RequestsTile({required this.transactionModel, super.key});

  String status() {
    if (transactionModel.requestStatus.trim().toLowerCase() == "active") {
      return "Válido até";
    }
    if (transactionModel.requestStatus.trim().toLowerCase() == "pending") {
      return "Pendente";
    }
    if (transactionModel.requestStatus.trim().toLowerCase() == "expired") {
      return "Expirou em";
    }
    if (transactionModel.requestStatus.trim().toLowerCase() == "rejected") {
      return "Você rejeitou esta solicitação";
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        transactionModel.requester,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto",
            color: IdColors.unselectedconColor),
      ),
      subtitle: Text("tem acesso a: ${transactionModel.requestData}"),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            status(),
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: IdColors.selectedColor),
          ),
          Text(
            transactionModel.requestUntil,
            style: const TextStyle(color: IdColors.selectedColor),
          )
        ],
      ),
    );
  }
}
