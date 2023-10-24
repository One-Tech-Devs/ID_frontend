import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../core/data/models/user_model.dart';

class HelloWidget extends StatelessWidget {
  final UserModel userModel;

  const HelloWidget({required this.userModel, super.key});

  @override
  Widget build(BuildContext context) {
    const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);
    return Text(
      "Olá, ${userModel.name}",
      style: const TextStyle(
          fontSize: 24, fontFamily: "Roboto", color: iconSelectedColor),
    );
  }
}
