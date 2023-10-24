import 'package:flutter/material.dart';

List<String> filterList = [
  'Mais antigo',
  "Mais recente",
  "Expirando",
  "Ordem Alfabética A-Z",
  "Ordem Alfabética Z-A"
];
const iUnselectedconColor = Color.fromARGB(255, 0, 64, 149);

class FilterDropButton extends StatefulWidget {
  const FilterDropButton({super.key});

  @override
  State<FilterDropButton> createState() => _FilterDropButtonState();
}

class _FilterDropButtonState extends State<FilterDropButton> {
  String dropdownValue = filterList.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        style: const TextStyle(
            fontFamily: "Roboto",
            color: iUnselectedconColor,
            fontSize: 16,
            fontWeight: FontWeight.w700),
        isExpanded: true,
        elevation: 12,
        value: dropdownValue,
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: filterList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}
