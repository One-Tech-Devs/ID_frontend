import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SharedField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  String field;
  SharedField({required this.controller, required this.field, super.key});

  @override
  State<SharedField> createState() => _SharedFieldState();
}

class _SharedFieldState extends State<SharedField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "O campo ${widget.field} deve ser preenchido";
            }
            return null;
          },
          decoration: InputDecoration(
              label: Text(widget.field),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide()))),
    );
  }
}
