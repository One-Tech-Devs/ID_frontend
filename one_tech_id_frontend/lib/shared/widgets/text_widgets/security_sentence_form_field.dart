import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';

// ignore: must_be_immutable
class SecuritySentenceField extends StatelessWidget {
  TextEditingController sentenceController = TextEditingController();

  SecuritySentenceField({required this.sentenceController, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: sentenceController,
        validator: ((value) {
          if (value == null || value.trim().isEmpty) {
            return "Insira uma Frase de segurança para terminar o cadastro";
          }
          return null;
        }),
        decoration: const InputDecoration(
            helperStyle: TextStyle(fontSize: 14, color: IdColors.selectedColor),
            helperMaxLines: 2,
            helperText:
                "Espaços, letras maiúsculas e minúsculas são levados em consideração",
            label: Text("Frase Secreta"),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide())),
      ),
    );
  }
}
