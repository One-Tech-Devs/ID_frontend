// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/screens/access/login_screen.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/shared_text_form_field.dart';
import '../../core/data/models/user_model.dart';
import '../../core/data/repositories/mock/sqflite_mock_data/sqflite_user_repository.dart';
import '../../shared/widgets/text_widgets/password_text_form_field.dart';

// ignore: must_be_immutable
class CreateAccountScreenName extends StatefulWidget {
  const CreateAccountScreenName({super.key});

  @override
  State<CreateAccountScreenName> createState() =>
      _CreateAccountScreenNameState();
}

class _CreateAccountScreenNameState extends State<CreateAccountScreenName> {
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

  TextEditingController cpfController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cpfController.text = userModel.cpf;
  }

  @override
  void dispose() {
    cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const MaxGap(85),
            SizedBox(
                height: 85,
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
            const MaxGap(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 55),
              child: Text(
                textAlign: TextAlign.left,
                "Vamos precisar de alguns dados para criar o seu cadastro",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Roboto",
                    color: IdColors.unselectedconColor),
              ),
            ),
            const MaxGap(35),
            SizedBox(
                width: 350,
                child: SharedField(field: "CPF", controller: cpfController)),
            const MaxGap(16),
            SizedBox(
                width: 350,
                child: SharedField(field: "Nome", controller: nameController)),
            const MaxGap(16),
            SizedBox(
                width: 350,
                child: PasswordField(passwordController: passwordController)),
            const MaxGap(35),
            FilledButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    userModel.cpf = cpfController.text;
                    userModel.name = nameController.text;
                    userModel.password = passwordController.text;

                    if (userModel.id == null) {
                      await SQFLiteUserRepository.add(userModel);
                    } else {
                      await SQFLiteUserRepository.update(userModel);
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  }
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
