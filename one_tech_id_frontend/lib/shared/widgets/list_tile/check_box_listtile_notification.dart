import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxDataTile extends StatefulWidget {
  final String value;
  bool checkBoxValue;

  CheckBoxDataTile(
      {required this.value, required this.checkBoxValue, super.key});

  @override
  State<CheckBoxDataTile> createState() => _CheckBoxDataTileState();
}

class _CheckBoxDataTileState extends State<CheckBoxDataTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(widget.value.toString()),
        value: widget.checkBoxValue,
        onChanged: (bool? value) {
          setState(() {
            widget.checkBoxValue = value!;
          });
        });
  }
}
