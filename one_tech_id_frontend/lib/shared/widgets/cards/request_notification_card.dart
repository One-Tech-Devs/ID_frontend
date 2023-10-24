import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/blocs/notify_bloc.dart';
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

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.of<NotifyBloc>(context).transactionModelStream,
        builder: (context, snapshot) {
          return Expanded(
            child: Card(
              elevation: 1,
              child: Column(children: [
                Text(transactionModel.requester),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(""),
                ),
                CheckboxListTile(
                    title: Text("Nome"),
                    value: checkBoxValue,
                    onChanged: (bool? value) {
                      setState(() {
                        checkBoxValue = value!;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 12),
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
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Roboto",
                                color: Colors.white),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 173, 51, 0))),
                          onPressed: () {},
                          child: const Text(
                            "Recusar",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Roboto",
                                color: Colors.white),
                          ))
                    ],
                  ),
                )
              ]),
            ),
          );
        });
  }
}
