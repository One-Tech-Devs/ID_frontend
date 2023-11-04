// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/screens/create_account/create_account_name.dart';
import 'package:one_tech_data_control/screens/landing_screen.dart';
import 'package:one_tech_data_control/shared/widgets/login/bottom_sheet_login.dart';
import '../../core/services/local_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isIOS = false;

  void setPlatform() {
    Platform.isIOS ? isIOS = true : isIOS = false;
  }

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
                    "Seus dados também são os seus bens. Proteja-os e só compartilhe-os quando necessário",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.14,
                  ),
                  SizedBox(
                      width: constraints.maxWidth * 0.76,
                      child: !isIOS
                          ? FilledButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      IdColors.unselectedconColor)),
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return BottomSheetLogin(
                                        constraints: constraints);
                                  },
                                );
                              },
                              child: const Text(
                                "Usuário e Senha",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Roboto"),
                              ))
                          : CupertinoButton.filled(
                              onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return BottomSheetLogin(
                                        constraints: constraints);
                                  },
                                );
                              },
                              child: const Text("Usuário e Senha"),
                            )),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: constraints.maxWidth * 0.76,
                      child: !isIOS
                          ? FilledButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      IdColors.unselectedconColor)),
                              onPressed: () async {
                                final authenticate =
                                    await LocalAuth.authenticate();

                                setState(() {
                                  authenticated = authenticate;
                                });

                                if (authenticated) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LandingScreen(),
                                  ));
                                }
                              },
                              child: const Text("Senha do Celular"))
                          : CupertinoButton.filled(
                              child: const Text("Senha do iPhone"),
                              onPressed: () async {
                                final authenticate =
                                    await LocalAuth.authenticate();

                                setState(() {
                                  authenticated = authenticate;
                                });

                                if (authenticated) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LandingScreen(),
                                  ));
                                }
                              })),
                  SizedBox(
                    height: constraints.maxHeight * 0.1,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateAccountScreenName(),
                        ));
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Não possui uma ID ainda? Clique aqui para criar uma.",
                        style: TextStyle(color: IdColors.unselectedconColor),
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
