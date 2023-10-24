import 'package:flutter/material.dart';
import '../filter_button/dropdown_filter.dart';
import '../text_widgets/no_active_request_text.dart';

class ActiveHistory extends StatefulWidget {
  const ActiveHistory({super.key});

  @override
  State<ActiveHistory> createState() => _ActiveHistoryState();
}

class _ActiveHistoryState extends State<ActiveHistory> {
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
                      message: "Nenhum dado seu está sendo compartilhado. \n"
                          "Você pode acessar a aba expirados aqui no histórico para verificar quais foram os seus ultimos dados compartilhados",
                    ),
                  ),
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
