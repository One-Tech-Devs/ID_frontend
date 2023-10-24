import 'package:flutter/material.dart';

class NoActiveRequest extends StatelessWidget {
  final String message;
  const NoActiveRequest({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 87, 23),
        fontSize: 18,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
