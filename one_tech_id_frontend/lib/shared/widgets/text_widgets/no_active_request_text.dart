import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';

class NoActiveRequest extends StatelessWidget {
  final String message;
  const NoActiveRequest({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        color: IdColors.selectedColor,
        fontSize: 18,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
