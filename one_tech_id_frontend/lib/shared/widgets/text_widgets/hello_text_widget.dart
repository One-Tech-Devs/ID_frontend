import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import '../../../core/data/models/user_model.dart';

class HelloWidget extends StatelessWidget {
  final UserModel userModel;

  const HelloWidget({required this.userModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Olá, ${userModel.name}",
      style: const TextStyle(
          fontSize: 26,
          fontFamily: "Roboto",
          color: IdColors.selectedColor,
          fontWeight: FontWeight.w600),
    );
  }
}
