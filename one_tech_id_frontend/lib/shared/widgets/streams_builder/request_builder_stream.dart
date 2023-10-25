import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/no_active_request_text.dart';
import '../../../blocs/notify_bloc.dart';
import '../list_tile/requests_tile.dart';

class StreamRequestsBuilder extends StatefulWidget {
  final String status;
  final String onEmptyList;
  const StreamRequestsBuilder(
      {required this.status, required this.onEmptyList, super.key});

  @override
  State<StreamRequestsBuilder> createState() => _StreamRequestsBuilderState();
}

class _StreamRequestsBuilderState extends State<StreamRequestsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: BlocProvider.of<NotifyBloc>(context).transactionModelStream,
        builder: (context, snapshot) {
          List<TransactionModel> requestList = [];

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }

          if (snapshot.data!.requestStatus.trim().toLowerCase() ==
              widget.status.toLowerCase()) {
            requestList.add(snapshot.data!);
          }

          if (requestList.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child:
                  Center(child: NoActiveRequest(message: widget.onEmptyList)),
            );
          }

          return SizedBox(
            height: 95,
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
    );
  }
}
