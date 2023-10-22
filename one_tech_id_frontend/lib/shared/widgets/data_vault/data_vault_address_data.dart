import 'package:flutter/material.dart';

import '../text_widgets/data_text_form_field.dart';

class DataVaultAddress extends StatefulWidget {
  const DataVaultAddress({super.key});

  @override
  State<DataVaultAddress> createState() => _DataVaultAddressState();
}

class _DataVaultAddressState extends State<DataVaultAddress> {
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
    bool edit = true;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            if (edit)
              Container(
                child: TextForm(
                  text: "Logradouro",
                  color: iUnselectedconColor,
                ),
              ),
            const SizedBox(
              height: 12,
            ),
            const TextForm(
              text: "Número",
              color: iUnselectedconColor,
            ),
            const SizedBox(
              height: 12,
            ),
            const TextForm(
              text: "Bairro",
              color: iUnselectedconColor,
            ),
            const SizedBox(
              height: 12,
            ),
            const TextForm(
              text: "Cidade",
              color: iUnselectedconColor,
            ),
            const SizedBox(
              height: 12,
            ),
            const TextForm(
              text: "Estado",
              color: iUnselectedconColor,
            ),
            const SizedBox(
              height: 12,
            ),
            const TextForm(
              text: "País",
              color: iUnselectedconColor,
            ),
            const SizedBox(
              height: 12,
            ),
            const TextForm(
              text: "CEP",
              color: iUnselectedconColor,
            ),
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
