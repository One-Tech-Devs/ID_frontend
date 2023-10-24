import 'package:flutter/material.dart';

class ActiveHistory extends StatefulWidget {
  final List<String> listRequests;
  const ActiveHistory({required this.listRequests, super.key});

  @override
  State<ActiveHistory> createState() => _ActiveHistoryState();
}

class _ActiveHistoryState extends State<ActiveHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, constraints) {
        if (widget.listRequests.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Nenhum dado seu está sendo compartilhado. \n"
                "Você pode acessar a aba expirados aqui no histórico para verificar quais foram os seus ultimos dados compartilhados",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 87, 23),
                  fontSize: 18,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }
        return ListView();
      },
    );
  }
}
