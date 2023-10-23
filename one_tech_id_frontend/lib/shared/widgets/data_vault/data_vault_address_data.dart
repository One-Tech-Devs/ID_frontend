import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/address_model.dart';
import 'package:one_tech_data_control/core/data/repositories/sqflite_address_repository.dart';
import 'package:one_tech_data_control/core/data/repositories/zip_code_repository.dart';
import 'package:one_tech_data_control/shared/widgets/list_view/data_vault/list_view_address.dart';

class DataVaultAddress extends StatefulWidget {
  bool edit = false;
  DataVaultAddress({super.key});

  @override
  State<DataVaultAddress> createState() => _DataVaultAddressState();
}

class _DataVaultAddressState extends State<DataVaultAddress> {
  final pageViewController = PageController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  static const iUnselectedconColor = Color.fromARGB(255, 0, 64, 149);
  static const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);

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
              return Center(child: LinearProgressIndicator());
            }
            if (snapshot.data!.length == 0) {
              return AddressInsertData(
                  addressModel: AddressModel(
                      street: "",
                      number: "",
                      neighborhood: "",
                      city: "",
                      state: "",
                      country: "",
                      zipCode: "",
                      ddd: "",
                      gia: "",
                      ibge: "",
                      siafi: ""),
                  onChange: () {
                    setState(() {});
                  });
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              },
            );
          }),
    );
  }
}
