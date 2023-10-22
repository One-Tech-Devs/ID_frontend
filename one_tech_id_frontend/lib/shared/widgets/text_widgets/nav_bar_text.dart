import 'package:flutter/material.dart';

class TextNavBar extends StatelessWidget {
  final String text;
  const TextNavBar({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w500));
  }
}
