import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SharedField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  SharedField({required this.controller, super.key});

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
              return "O campo cpf deve ser preenchido";
            }
            return null;
          },
          decoration: const InputDecoration(
              label: Text("CPF"),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  borderSide: BorderSide()))),
    );
  }
}
