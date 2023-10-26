import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';

List<String> filterList = [
  'Mais antigo',
  "Mais recente",
  "Expirando",
  "Ordem Alfabética A-Z",
  "Ordem Alfabética Z-A"
];

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
            color: IdColors.unselectedconColor,
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
