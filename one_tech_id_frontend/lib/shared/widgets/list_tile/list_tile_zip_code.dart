import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/address_model.dart';
import 'list_tile_data_vault.dart';

class AddressTile extends StatelessWidget {
  final AddressModel addressModel;
  final VoidCallback onChange;

  const AddressTile(
      {required this.addressModel, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 580,
      width: 250,
      child: ListView(
        children: [
          Column(
            children: [
              TileDataVault(
                title: "Rua",
                subTitle: addressModel.street,
              ),
              TileDataVault(
                title: "Número",
                subTitle: addressModel.number,
              ),
              TileDataVault(
                title: "Bairro",
                subTitle: addressModel.neighborhood,
              ),
              TileDataVault(
                title: "Cidade",
                subTitle: addressModel.city,
              ),
              TileDataVault(
                title: "Estado",
                subTitle: addressModel.state,
              ),
              TileDataVault(
                title: "País",
                subTitle: addressModel.country,
              ),
              const SizedBox(
                height: 35,
              ),
              Card(
                  elevation: 1,
                  child: SizedBox(
                      height: 68,
                      width: 68,
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit))))
            ],
          ),
        ],
      ),
    );
  }
}
