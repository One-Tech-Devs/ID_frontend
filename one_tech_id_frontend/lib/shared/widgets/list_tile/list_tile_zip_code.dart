import 'package:flutter/material.dart';

class AddressTile extends StatelessWidget {
  String title;
  String subTitle;
  AddressTile({required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 1,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(subTitle),
        ),
      ),
    );
  }
}
