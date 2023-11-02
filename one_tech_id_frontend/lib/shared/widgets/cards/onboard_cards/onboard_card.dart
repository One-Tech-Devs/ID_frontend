// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/screens/access/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class OnBoardCard extends StatelessWidget {
  final String imageHeader;
  final String title;
  final String description;
  final bool lastPage;

  const OnBoardCard(
      {required this.imageHeader,
      required this.title,
      required this.description,
      required this.lastPage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 288,
        width: double.infinity,
        child: Image.asset(imageHeader, fit: BoxFit.cover),
      ),
      const MaxGap(25),
      Text(
        textAlign: TextAlign.center,
        title,
        style: const TextStyle(
            fontSize: 24,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w800,
            color: IdColors.selectedColor),
      ),
      const MaxGap(10),
      Center(
        child: Text(
          description,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              color: IdColors.unselectedconColor),
        ),
      ),
      const SizedBox(
        height: 55,
      ),
      lastPage
          ? Column(
              children: [
                FilledButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            IdColors.unselectedconColor)),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                    },
                    child: const Text("Crie sua conta aqui.")),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showHome', true);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  },
                  child: const Text(
                    textAlign: TextAlign.center,
                    "Já possui uma conta? Clique aqui para fazer o entrar.",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontSize: 14,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink()
    ]);
  }
}
