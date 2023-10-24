import 'package:flutter/material.dart';

class TileDataVault extends StatefulWidget {
  final String title;
  final String subTitle;

  const TileDataVault({required this.title, required this.subTitle, super.key});

  @override
  State<TileDataVault> createState() => _TileDataVaultState();
}

class _TileDataVaultState extends State<TileDataVault> {
  static const iUnselectedconColor = Color.fromARGB(255, 0, 64, 149);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 18,
            fontFamily: "Roboto",
            color: iUnselectedconColor,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        widget.subTitle,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
