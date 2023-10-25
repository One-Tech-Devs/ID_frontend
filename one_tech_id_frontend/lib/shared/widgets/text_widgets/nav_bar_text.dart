import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';

class TextNavBar extends StatelessWidget {
  final String text;
  const TextNavBar({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 14, fontFamily: "Roboto", fontWeight: FontWeight.w500));
  }
}
