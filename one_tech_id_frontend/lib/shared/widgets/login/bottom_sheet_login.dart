import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import '../../../screens/landing_screen.dart';

class BottomSheetLogin extends StatefulWidget {
  final dynamic constraints;

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  BottomSheetLogin({required this.constraints, super.key});

  @override
  State<BottomSheetLogin> createState() => _BottomSheetLoginState();
}

class _BottomSheetLoginState extends State<BottomSheetLogin> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
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
          TextFormField(
              controller: widget._userController,
              decoration: const InputDecoration(label: Text("Usuário"))),
          SizedBox(
            height: widget.constraints.maxHeight * 0.02,
          ),
          TextFormField(
            obscureText: !isHidden,
            controller: widget._passwordController,
            decoration: InputDecoration(
              label: const Text("Senha"),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon:
                      Icon(isHidden ? Icons.visibility : Icons.visibility_off)),
            ),
          ),
          SizedBox(
            height: widget.constraints.maxHeight * 0.02,
          ),
          FilledButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(IdColors.unselectedconColor)),
              onPressed: () async {
                if (widget._userController.text == "hackweek@devs.com" &&
                    widget._passwordController.text == "+Devs2023") {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LandingScreen(),
                    ));
                  });
                }
              },
              child: const Text(
                "Entrar",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto"),
              ))
        ]));
  }
}
