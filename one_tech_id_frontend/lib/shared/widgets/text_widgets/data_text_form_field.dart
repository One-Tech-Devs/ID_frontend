import 'package:flutter/material.dart';

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
              fillColor: const Color.fromARGB(255, 224, 204, 255),
              labelText: text,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide()))),
    );
  }
}
