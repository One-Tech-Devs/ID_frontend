import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/data_text_form_field.dart';
import 'create_account_email_password.dart';

// ignore: must_be_immutable
class CreateAccountScreenName extends StatelessWidget {
  CreateAccountScreenName({super.key});

  TextEditingController nameController = TextEditingController();
  GlobalKey nameKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MaxGap(25),
          SizedBox(
              height: 150,
              child: Image.asset(
                'assets/app/ID_transp.png',
                fit: BoxFit.cover,
              )),
          const MaxGap(25),
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
          const MaxGap(55),
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
          const MaxGap(85),
          SizedBox(
              width: 295,
              child: TextForm(
                  key: nameKey,
                  text: "Nome",
                  controller: nameController,
                  inputFormat: TextInputType.name)),
          const MaxGap(65),
          FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreateAccountEmailPassword(),
                ));
              },
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(IdColors.unselectedconColor)),
              child: const Text("Prosseguir"))
        ],
      ),
    );
  }
}
