import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBoardButton extends StatelessWidget {
  final VoidCallback onClick;
  final Widget label;

  OnBoardButton({required this.onClick, required this.label, super.key});

  bool isIOS = false;

  void setPlatform() {
    if (Platform.isIOS) {
      isIOS = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? CupertinoButton(
            onPressed: onClick,
            child: label,
          )
        : TextButton(onPressed: onClick, child: label);
  }
}
