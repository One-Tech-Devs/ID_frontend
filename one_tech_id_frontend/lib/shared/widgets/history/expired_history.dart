import 'package:flutter/material.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/no_active_request_text.dart';
import '../filter_button/dropdown_filter.dart';

class ExpiredHistory extends StatefulWidget {
  const ExpiredHistory({super.key});

  @override
  State<ExpiredHistory> createState() => _ExpiredHistoryState();
}

class _ExpiredHistoryState extends State<ExpiredHistory> {
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
                              "Você ainda não possui compartilhamentos expirados. \n"
                              "Quando algum compartilhamento expirar, você será avisado e será possível verificar aqui neste local a lista de expirados.")),
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
