import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/no_active_request_text.dart';
import '../../../blocs/notify_bloc.dart';
import '../filter_button/dropdown_filter.dart';
import '../list_tile/requests_tile.dart';

class PendingHistory extends StatefulWidget {
  const PendingHistory({super.key});

  @override
  State<PendingHistory> createState() => _PendingHistoryState();
}

class _PendingHistoryState extends State<PendingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 550,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 12, left: 16, right: 16),
              child: FilterDropButton(),
            ),
            StreamBuilder(
              stream:
                  BlocProvider.of<NotifyBloc>(context).transactionModelStream,
              builder: (context, snapshot) {
                List<TransactionModel> requestList = [];
                requestList.add(snapshot.data!);

                if (!snapshot.hasData) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: NoActiveRequest(
                            message:
                                "Você não possui nenhuma solicitação pendente no momento. \nNão se preocupe, nós notificaremos quando aparecerem novas solicitações.")),
                  );
                }
                return Container(
                  height: 120,
                  child: Card(
                    elevation: 2,
                    child: ListView.builder(
                      itemCount: requestList.length,
                      itemBuilder: (context, index) =>
                          RequestsTile(transactionModel: requestList[index]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
