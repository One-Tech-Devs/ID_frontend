import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/blocs/notify_bloc.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
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
      requestUntil: '',
      requestStatus: '');

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.of<NotifyBloc>(context).transactionModelStream,
        builder: (context, snapshot) {
          List<String> dataRequested = snapshot.data!.requestData.split(', ');
          snapshot.data!.requestStatus == "pending";

          if (!snapshot.hasData)
            return Container(
              height: 0,
              width: 0,
            );

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 4),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 12, right: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.left,
                            "${snapshot.data!.requester.toUpperCase()}",
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    IdColors.rejectButton)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 16, right: 16, bottom: 12),
                    child: Text(
                      "Solicita o acesso a alguns dos seus dados até a data ${snapshot.data!.requestUntil}. A seguir é possível verificar os dados, selecionar e aprovar o acesso a eles.",
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                          color: IdColors.unselectedconColor),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: dataRequested.length,
                        itemBuilder: (context, index) => Container(
                              height: 55,
                              child: CheckBoxDataTile(
                                  checkBoxValue: true,
                                  value: dataRequested[index]),
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      IdColors.unselectedconColor)),
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
                                      IdColors.rejectButton)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Ignorar",
                                style: TextStyle(color: Colors.white),
                              ))
                        ]),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
