import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("Olá, user"),
            ),
          ),
          Center(
              child: Text(
            "Nenhuma solicitação encontrada",
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600),
          )),
        ],
      ),
    );
  }
}
