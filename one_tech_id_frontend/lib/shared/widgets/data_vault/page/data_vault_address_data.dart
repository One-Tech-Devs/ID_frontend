import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/address_model.dart';

import 'package:one_tech_data_control/shared/widgets/data_vault/insert_list_widget/insert_address_data.dart';

import '../../../../core/data/repositories/mock/sqflite_mock_data/sqflite_address_repository.dart';

class DataVaultAddress extends StatefulWidget {
  const DataVaultAddress({super.key});

  @override
  State<DataVaultAddress> createState() => _DataVaultAddressState();
}

class _DataVaultAddressState extends State<DataVaultAddress> {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: SQFLiteAddressRepository.getAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: LinearProgressIndicator());
            }
            if (snapshot.data!.isEmpty) {
              return AddressInsertData(
                  addressModel: AddressModel(
                      street: '',
                      number: '',
                      neighborhood: '',
                      city: '',
                      state: '',
                      country: '',
                      zipCode: ''),
                  onChange: () {
                    setState(() {});
                  });
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => AddressInsertData(
                addressModel: snapshot.data![index],
                onChange: () {
                  setState(() {});
                },
              ),
            );
          }),
    );
  }
}
