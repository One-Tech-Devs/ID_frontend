import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final Color color;
  final String text;

  const TextForm({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(borderSide: BorderSide(color: color))));
  }
}
