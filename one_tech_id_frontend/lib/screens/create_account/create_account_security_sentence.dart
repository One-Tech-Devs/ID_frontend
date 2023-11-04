import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/screens/access/login_screen.dart';
import '../../shared/widgets/text_widgets/security_sentence_form_field.dart';

class CreateAccountSecuritySentence extends StatefulWidget {
  const CreateAccountSecuritySentence({super.key});

  @override
  State<CreateAccountSecuritySentence> createState() =>
      _CreateAccountSecuritySentenceState();
}

class _CreateAccountSecuritySentenceState
    extends State<CreateAccountSecuritySentence> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController sentenceController = TextEditingController();

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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
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
