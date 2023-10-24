import 'package:flutter/material.dart';

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
          validator: (value) {
            return (value != null && value.contains("@"))
                ? "Não é permitido @"
                : null;
          },
          keyboardType: inputFormat,
          controller: controller,
          decoration: InputDecoration(
              fillColor: Color.fromARGB(255, 224, 204, 255),
              labelText: text,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide()))),
    );
  }
}
