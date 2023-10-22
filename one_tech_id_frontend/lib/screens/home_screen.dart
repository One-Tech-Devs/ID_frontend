import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: const Text(
        "Nenhuma solicitação encontrada",
        style: TextStyle(
            fontSize: 22, fontFamily: "Roboto", fontWeight: FontWeight.w600),
      )),
    );
  }
}
