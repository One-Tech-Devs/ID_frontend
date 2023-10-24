import 'package:flutter/material.dart';

class ExpiredHistory extends StatefulWidget {
  final List<String> listRequests;
  const ExpiredHistory({required this.listRequests, super.key});

  @override
  State<ExpiredHistory> createState() => _ExpiredHistoryState();
}

class _ExpiredHistoryState extends State<ExpiredHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, constraints) {
        if (widget.listRequests.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Você ainda não possui compartilhamentos expirados. \n"
                "Quando algum compartilhamento expirar, você será avisado e será possível verificar aqui neste local a lista de expirados.",
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
