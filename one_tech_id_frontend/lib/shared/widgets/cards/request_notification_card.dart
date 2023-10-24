import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';

class RequestNotificationCard extends StatefulWidget {
  RequestNotificationCard({super.key});

  @override
  State<RequestNotificationCard> createState() =>
      _RequestNotificationCardState();
}

class _RequestNotificationCardState extends State<RequestNotificationCard> {
  TransactionModel transactionModel = TransactionModel(
      requestData: '',
      requester: '',
      requestDate: '',
      requestUntil: '23.11.2023',
      requestStatus: '');

  Map<String, dynamic> request = {
    "requestData": "Nome, CPF, E-Mail, Telefone",
    "requestDate": "24.10.2023",
    "requestUntil": "23.11.2023",
    "requester": "Senior"
  };

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 1,
        child: Column(children: [
          Text(transactionModel.requester),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
                "Senior Sistemas, solicita o acesso a alguns dos seus dados até a data 23/11/2023. A seguir é possível verificar os dados, selecionar e aprovar o acesso a eles."),
          ),
          CheckboxListTile(
              title: Text("Nome"),
              value: checkBoxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkBoxValue = value!;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Liberar")),
              ElevatedButton(onPressed: () {}, child: Text("Recusar"))
            ],
          )
        ]),
      ),
    );
  }
}
