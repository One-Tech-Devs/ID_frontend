import 'package:flutter/material.dart';

import '../../../config/colors_constant/colors_code.dart';
import '../../../core/data/models/transaction_model.dart';

class RequestDetails extends StatelessWidget {
  final TransactionModel transactionModel;
  const RequestDetails({required this.transactionModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 295),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    transactionModel.requester,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: IdColors.unselectedconColor),
                  )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: IdColors.rejectButton,
                      ))
                ],
              ),
            ),
            const Text(
              "Tem acesso aos seguintes dados: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Text(
                transactionModel.requestData,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "O acesso expira em: ${transactionModel.requestUntil}",
                style: const TextStyle(
                    color: IdColors.selectedColor, fontSize: 20),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
