import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/no_active_request_text.dart';

import '../../../blocs/user_bloc.dart';
import '../filter_button/dropdown_filter.dart';

class PendingHistory extends StatefulWidget {
  const PendingHistory({super.key});

  @override
  State<PendingHistory> createState() => _PendingHistoryState();
}

class _PendingHistoryState extends State<PendingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 12, left: 16, right: 16),
            child: FilterDropButton(),
          ),
          StreamBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: NoActiveRequest(
                          message:
                              "Você não possui nenhuma solicitação pendente no momento. \nNão se preocupe, nós notificaremos quando aparecerem novas solicitações.")),
                );
              }
              return ListView();
            },
          ),
        ],
      ),
    );
  }
}
