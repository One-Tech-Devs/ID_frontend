import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/blocs/notify_bloc.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';

import '../list_tile/check_box_listtile_notification.dart';

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

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.of<NotifyBloc>(context).transactionModelStream,
        builder: (context, snapshot) {
          List<String> dataRequested = snapshot.data!.requestData.split(', ');

          if (!snapshot.hasData)
            return Container(
              height: 0,
              width: 0,
            );

          return Card(
            child: Container(
              height: 550,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "${snapshot.data!.requester}, solicita o acesso a alguns dos seus dados até a data ${snapshot.data!.requestUntil}. A seguir é possível verificar os dados, selecionar e aprovar o acesso a eles.",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: dataRequested.length,
                        itemBuilder: (context, index) => CheckBoxDataTile(
                            checkBoxValue: true, value: dataRequested[index])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 0, 64, 149))),
                            onPressed: () {},
                            child: const Text(
                              "Liberar",
                              style: TextStyle(color: Colors.white),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 173, 51, 0))),
                            onPressed: () {},
                            child: const Text(
                              "Bloquear",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
