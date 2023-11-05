// ignore_for_file: use_build_context_synchronously
import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/blocs/user_bloc.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/core/data/repositories/mock/sqflite_mock_data/sqflite_user_repository.dart';
import '../../../screens/landing_screen.dart';
import '../text_widgets/shared_text_form_field.dart';
import '../text_widgets/password_text_form_field.dart';

class BottomSheetLogin extends StatefulWidget {
  final dynamic constraints;
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  BottomSheetLogin({required this.constraints, super.key});

  @override
  State<BottomSheetLogin> createState() => _BottomSheetLoginState();
}

class _BottomSheetLoginState extends State<BottomSheetLogin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(children: [
            const Text(
              "Identidade Digital",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: widget.constraints.maxHeight * 0.01,
            ),
            SharedField(controller: widget._cpfController),
            SizedBox(
              height: widget.constraints.maxHeight * 0.02,
            ),
            PasswordField(passwordController: widget._passwordController),
            SizedBox(
              height: widget.constraints.maxHeight * 0.02,
            ),
            FilledButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(IdColors.unselectedconColor)),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    var userAunthenticate =
                        await SQFLiteUserRepository.getLogin(
                            widget._cpfController.text.toString(),
                            widget._passwordController.text.toString());

                    if (widget._cpfController.text == userAunthenticate.cpf &&
                        widget._passwordController.text ==
                            userAunthenticate.password) {
                      BlocProvider.of<UserBloc>(context)
                          .setUser(userAunthenticate);
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LandingScreen(),
                        ));
                      });
                    }
                  }
                },
                child: const Text(
                  "Entrar",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ))
          ]),
        ));
  }
}
