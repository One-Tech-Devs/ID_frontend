import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/data_text_form_field.dart';
import 'create_account_email_password.dart';

// ignore: must_be_immutable
class CreateAccountScreenName extends StatefulWidget {
  const CreateAccountScreenName({super.key});

  @override
  State<CreateAccountScreenName> createState() =>
      _CreateAccountScreenNameState();
}

class _CreateAccountScreenNameState extends State<CreateAccountScreenName> {
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: nameKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 120,
                child: Image.asset(
                  'assets/app/ID_transp.png',
                  fit: BoxFit.cover,
                )),
            const MaxGap(16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                textAlign: TextAlign.center,
                "Bem Vindo a sua Identidade Digital",
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Roboto",
                    color: IdColors.unselectedconColor),
              ),
            ),
            const MaxGap(35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 75),
              child: Text(
                textAlign: TextAlign.justify,
                "Insira o seu Nome no campo a baixo para prosseguir.",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Roboto",
                    color: IdColors.unselectedconColor),
              ),
            ),
            const MaxGap(55),
            SizedBox(
                width: 350,
                child: TextForm(
                    text: "Nome",
                    controller: nameController,
                    inputFormat: TextInputType.name)),
            const MaxGap(45),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CreateAccountEmailPassword(),
                  ));
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(IdColors.unselectedconColor)),
                child: const Text("Prosseguir"))
          ],
        ),
      ),
    );
  }
}
