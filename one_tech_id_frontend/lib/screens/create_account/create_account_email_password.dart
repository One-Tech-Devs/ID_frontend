// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/core/data/repositories/mock/sqflite_mock_data/sqflite_user_repository.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/data_text_form_field.dart';
import '../../core/data/models/user_model.dart';
import '../../shared/widgets/text_widgets/password_text_form_field.dart';
import 'create_account_security_sentence.dart';

// ignore: must_be_immutable
class CreateAccountEmailPassword extends StatefulWidget {
  UserModel userModel = UserModel(
      password: '',
      securityPhrase: '',
      name: '',
      socialName: '',
      addressId: '',
      email: '',
      phone: '',
      cpf: '',
      rg: '',
      pis: '');
  CreateAccountEmailPassword({required this.userModel, super.key});

  @override
  State<CreateAccountEmailPassword> createState() =>
      _CreateAccountEmailPasswordState();
}

class _CreateAccountEmailPasswordState
    extends State<CreateAccountEmailPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Column(children: [
            const SizedBox(
              width: 370,
              child: Text(
                "Vamos cadastrar o seu e-mail",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    color: IdColors.unselectedconColor),
              ),
            ),
            const MaxGap(16),
            TextForm(
                text: "E-Mail",
                controller: emailController,
                inputFormat: TextInputType.emailAddress),
            const MaxGap(16),
            const SizedBox(
              width: 370,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "e uma senha.",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      color: IdColors.unselectedconColor),
                ),
              ),
            ),
            const MaxGap(16),
            PasswordField(passwordController: passwordController),
            const MaxGap(55),
            FilledButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(IdColors.unselectedconColor)),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    widget.userModel.email = emailController.text;
                    widget.userModel.password = passwordController.text;

                    await SQFLiteUserRepository.update(widget.userModel);

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateAccountSecuritySentence(
                        userModel: widget.userModel,
                      ),
                    ));
                  }
                },
                child: const Text("Prosseguir"))
          ]),
        ));
  }
}
