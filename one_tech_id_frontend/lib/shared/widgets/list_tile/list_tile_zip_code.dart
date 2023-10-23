import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/address_model.dart';

class AddressTile extends StatelessWidget {
  final AddressModel addressModel;
  final VoidCallback onChange;

  const AddressTile(
      {required this.addressModel, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: SizedBox(
        height: 550,
        width: 250,
        child: ListView(
          children: [
            ListTile(
              title: Text("Rua"),
              subtitle: Text(addressModel.street),
            ),
            ListTile(
              title: Text("Número"),
              subtitle: Text(addressModel.number),
            ),
            ListTile(
              title: Text("Bairro"),
              subtitle: Text(addressModel.neighborhood),
            ),
            ListTile(
              title: Text("Cidade"),
              subtitle: Text(addressModel.city),
            ),
            ListTile(
              title: Text("Estado"),
              subtitle: Text(addressModel.state),
            ),
            ListTile(
              title: Text("País"),
              subtitle: Text(addressModel.country),
            ),
          ],
        ),
      ),
    );
  }
}
