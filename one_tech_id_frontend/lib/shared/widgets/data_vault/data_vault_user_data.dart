import 'package:flutter/material.dart';

class DataVaultUserData extends StatefulWidget {
  const DataVaultUserData({super.key});

  @override
  State<DataVaultUserData> createState() => _DataVaultUserDataState();
}

class _DataVaultUserDataState extends State<DataVaultUserData> {
  final pageViewController = PageController();

  static const iUnselectedconColor = Color.fromARGB(255, 0, 64, 149);
  static const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nome",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: iUnselectedconColor)))),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nome Social",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: iUnselectedconColor)))),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    hintText: "Telefone",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: iUnselectedconColor)))),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    hintText: "E-mail",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)))),
            const SizedBox(
              height: 118,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.save,
                  color: iconSelectedColor,
                ))
          ]),
        ),
      ),
    );
  }
}
