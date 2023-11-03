import 'package:flutter/material.dart';

import '../../../config/colors_constant/colors_code.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  TextEditingController passwordController = TextEditingController();
  PasswordField({required this.passwordController, super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: !isVisible,
        textInputAction: TextInputAction.next,
        controller: widget.passwordController,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "O campo senha deve ser preenchido";
          }
          if (value.length <= 5) {
            return "A senha deve possuir pelo menos 6 caracteres";
          }
          if (!value.contains(RegExp(r'[A-Z]')) ||
              !value.contains(RegExp(r'[0-9]')) ||
              !value.contains(RegExp(r'[&!@#%*;:/?._-]'))) {
            return "A senha deve conter pelo menos uma letra maiúscula, um número e um caractere especial (@!#-_&%?/;:E)";
          }
          return null;
        },
        decoration: InputDecoration(
            errorMaxLines: 2,
            helperMaxLines: 2,
            helperText:
                "Insira aqui uma senha forte! Deve conter pelo menos 1 número, 1 letra maiúscula e 1 caractere especial",
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon:
                    Icon(isVisible ? Icons.visibility : Icons.visibility_off)),
            fillColor: IdColors.navBarColor,
            labelText: "Senha",
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                borderSide: BorderSide())),
      ),
    );
  }
}
