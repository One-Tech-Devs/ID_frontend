import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/screens/landing_screen.dart';
import 'package:one_tech_data_control/shared/widgets/login/bottom_sheet_login.dart';

import '../../blocs/user_bloc.dart';
import '../../core/data/models/user_model.dart';
import '../../core/data/repositories/sqflite_mock_data/sqflite_user_repository.dart';
import '../../core/services/local_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool authenticated = false;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 1,
                  maxWidth: constraints.maxWidth * 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Seus dados são o que você é. Proteja-os e só compartilhe-os quando necessário",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.14,
                  ),
                  Container(
                    width: constraints.maxWidth * 0.76,
                    child: FilledButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return BottomSheetLogin(constraints: constraints);
                            },
                          );
                        },
                        child: const Text(
                          "Usuário e Senha",
                          style: TextStyle(fontSize: 14, fontFamily: "Roboto"),
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: constraints.maxWidth * 0.76,
                    child: FilledButton(
                        onPressed: () async {
                          final authenticate = await LocalAuth.authenticate();
                          UserModel? userModel =
                              await SQFLiteUserRepository.get(1);

                          setState(() {
                            authenticated = authenticate;
                            BlocProvider.of<UserBloc>(context)
                                .setUser(userModel!);
                          });

                          if (authenticated) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LandingScreen(),
                            ));
                          }
                        },
                        child: const Text("Senha do Celular")),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.1,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Não possui uma ID ainda?\n Clique aqui para criar uma.",
                        style: TextStyle(),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
