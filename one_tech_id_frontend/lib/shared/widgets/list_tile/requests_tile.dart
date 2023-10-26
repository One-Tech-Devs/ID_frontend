import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';

import '../cards/request_details_card.dart';
import '../cards/request_notification_card.dart';

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

  bool isRejected() {
    if (transactionModel.requestStatus.trim().toLowerCase() == "rejected") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (transactionModel.requestStatus.contains("pending")) {
          _dialogPendingBuilder(context, transactionModel.id);
        }
        if (!transactionModel.requestStatus.contains("pending")) {
          _dialogDetailBuilder(context, transactionModel.id);
        }
      },
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

Future<void> _dialogPendingBuilder(
    BuildContext context, String? transactionModelId) {
  return showDialog<void>(
    useSafeArea: true,
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return RequestNotificationCard(
        transactionId: transactionModelId!,
      );
    },
  );
}

Future<void> _dialogDetailBuilder(
    BuildContext context, String? transactionModelId) {
  return showDialog<void>(
    useSafeArea: true,
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return RequestDetailsCard(
        transactionModelId: transactionModelId,
      );
    },
  );
}
