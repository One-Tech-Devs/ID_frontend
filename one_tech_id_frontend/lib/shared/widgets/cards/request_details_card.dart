import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';

import '../../../core/data/models/transaction_model.dart';

class RequestDetailsCard extends StatelessWidget {
  TransactionModel transactionModel = TransactionModel(
      requestData: "",
      requester: "",
      requestDate: "",
      requestUntil: "",
      requestStatus: "");
  RequestDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 75),
      child: Card(
        elevation: 2,
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                transactionModel.requester,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: IdColors.unselectedconColor),
              ))
            ],
          ),
          const Text(
            "Tem acesso aos seguintes dados: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(transactionModel.requestData),
          Text(
            "O acesso expira em: ${transactionModel.requestUntil}",
            style: TextStyle(color: IdColors.selectedColor, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
