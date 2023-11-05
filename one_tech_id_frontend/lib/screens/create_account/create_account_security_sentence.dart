// ignore_for_file: use_build_context_synchronously, must_be_immutable
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/core/data/repositories/mock/sqflite_mock_data/sqflite_user_repository.dart';
import 'package:one_tech_data_control/screens/access/login_screen.dart';
import '../../core/data/models/user_model.dart';
import '../../shared/widgets/text_widgets/security_sentence_form_field.dart';

class CreateAccountSecuritySentence extends StatefulWidget {
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
  CreateAccountSecuritySentence({required this.userModel, super.key});

  @override
  State<CreateAccountSecuritySentence> createState() =>
      _CreateAccountSecuritySentenceState();
}

class _CreateAccountSecuritySentenceState
    extends State<CreateAccountSecuritySentence> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController sentenceController = TextEditingController();

  @override
  void dispose() {
    sentenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              width: 370,
              child: Text(
                "Precisamos agora de uma frase secreta. Ela sera usada para recuperar o acesso a sua Identidade Digital caso ocorra algum problema com a sua senha.",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    color: IdColors.unselectedconColor),
              ),
            ),
            const MaxGap(25),
            SecuritySentenceField(sentenceController: sentenceController),
            const MaxGap(25),
            FilledButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    widget.userModel.securityPhrase = sentenceController.text;

                    await SQFLiteUserRepository.update(widget.userModel);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  }
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(IdColors.unselectedconColor)),
                child: const Text("Finalizar"))
          ],
        ),
      ),
    );
  }
}
