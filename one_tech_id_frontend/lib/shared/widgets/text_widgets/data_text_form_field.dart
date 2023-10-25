import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  final String text;

  TextEditingController controller = TextEditingController();
  final TextInputType inputFormat;

  TextForm(
      {required this.text,
      required this.controller,
      required this.inputFormat,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: TextFormField(
          keyboardType: inputFormat,
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              fillColor: IdColors.navBarColor,
              labelText: text,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide()))),
    );
  }
}
