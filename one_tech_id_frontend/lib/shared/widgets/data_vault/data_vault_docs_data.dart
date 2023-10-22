import 'package:flutter/material.dart';

class DataVaultDocsData extends StatefulWidget {
  const DataVaultDocsData({super.key});

  @override
  State<DataVaultDocsData> createState() => _DataVaultDocsDataState();
}

class _DataVaultDocsDataState extends State<DataVaultDocsData> {
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
                    hintText: "CPF",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: iUnselectedconColor)))),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    hintText: "RG",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: iUnselectedconColor)))),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    hintText: "PIS",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: iUnselectedconColor)))),
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
