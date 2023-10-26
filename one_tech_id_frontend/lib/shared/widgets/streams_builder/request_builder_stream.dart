import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';
import 'package:one_tech_data_control/shared/widgets/filter_button/dropdown_filter.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/no_active_request_text.dart';
import '../../../blocs/notify_bloc.dart';
import '../list_tile/requests_tile.dart';

List<String> filterList = [
  'Mais antigo',
  "Mais recente",
  "Expirando",
  "Ordem Alfabética A-Z",
  "Ordem Alfabética Z-A"
];

class StreamRequestsBuilder extends StatefulWidget {
  final String status;
  final String onEmptyList;
  const StreamRequestsBuilder(
      {required this.status, required this.onEmptyList, super.key});

  @override
  State<StreamRequestsBuilder> createState() => _StreamRequestsBuilderState();
}

class _StreamRequestsBuilderState extends State<StreamRequestsBuilder> {
  late String orderBy;
  String dropdownValue = filterList.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FilterDropButton(),
      ),
      body: StreamBuilder(
        stream: BlocProvider.of<NotifyBloc>(context).listTransactionModelStream,
        builder: (context, snapshot) {
          List<TransactionModel> requestList = [];

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }

          for (int i = 0; i < snapshot.data!.length; i++) {
            if (snapshot.data![i].requestStatus.trim().toLowerCase() ==
                widget.status.toLowerCase()) {
              requestList.add(snapshot.data![i]);
              requestList.sort(
                (a, b) => a.requester.compareTo(b.requester),
              );
            }
          }

          if (requestList.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child:
                  Center(child: NoActiveRequest(message: widget.onEmptyList)),
            );
          }

          return ListView.builder(
            itemCount: requestList.length,
            itemBuilder: (context, index) => SizedBox(
                height: 90,
                child: Card(
                    elevation: 2,
                    child: RequestsTile(transactionModel: requestList[index]))),
          );
        },
      ),
    );
  }
}
