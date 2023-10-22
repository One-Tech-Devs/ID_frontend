import 'package:flutter/material.dart';

class PendingHistory extends StatefulWidget {
  final List<String> listRequests;

  const PendingHistory({required this.listRequests, super.key});

  @override
  State<PendingHistory> createState() => _PendingHistoryState();
}

class _PendingHistoryState extends State<PendingHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, constraints) {
        if (widget.listRequests.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Você não possui nenhuma solicitação pendente no momento. \nNão se preocupe, nós notificaremos quando aparecerem novas solicitações.",
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
