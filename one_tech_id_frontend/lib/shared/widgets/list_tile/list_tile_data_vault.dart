import 'package:flutter/material.dart';

class TileDataVault extends StatefulWidget {
  final String title;
  final String subTitle;

  const TileDataVault({required this.title, required this.subTitle, super.key});

  @override
  State<TileDataVault> createState() => _TileDataVaultState();
}

class _TileDataVaultState extends State<TileDataVault> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        title: Text(widget.title),
        subtitle: Text(widget.subTitle),
      ),
    );
  }
}
