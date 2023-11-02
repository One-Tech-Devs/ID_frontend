import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/address_model.dart';

import '../../../../core/data/repositories/mock/sqflite_mock_data/sqflite_address_repository.dart';
import '../../list_tile/list_tile_data_vault.dart';
import '../../text_widgets/data_text_form_field.dart';

// ignore: must_be_immutable
class AddressInsertData extends StatefulWidget {
  AddressModel addressModel = AddressModel(
      street: '',
      number: '',
      neighborhood: '',
      city: '',
      state: '',
      country: '',
      zipCode: '');
  final VoidCallback onChange;
  AddressInsertData(
      {required this.addressModel, required this.onChange, super.key});

  @override
  State<AddressInsertData> createState() => _AddressInsertDataState();
}

class _AddressInsertDataState extends State<AddressInsertData> {
  static const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    streetController.text = widget.addressModel.street;
    numberController.text = widget.addressModel.number;
    neighborhoodController.text = widget.addressModel.neighborhood;
    cityController.text = widget.addressModel.city;
    stateController.text = widget.addressModel.state;
    countryController.text = widget.addressModel.country;
    zipCodeController.text = widget.addressModel.zipCode;
  }

  bool onEdit = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      width: 250,
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            onEdit
                ? TextForm(
                    controller: zipCodeController,
                    inputFormat: TextInputType.number,
                    text: "CEP",
                  )
                : TileDataVault(
                    title: "CEP", subTitle: widget.addressModel.zipCode),
            onEdit
                ? TextForm(
                    controller: streetController,
                    inputFormat: TextInputType.streetAddress,
                    text: "Rua",
                  )
                : TileDataVault(
                    title: "Rua", subTitle: widget.addressModel.street),
            onEdit
                ? TextForm(
                    controller: numberController,
                    inputFormat: TextInputType.number,
                    text: "Número",
                  )
                : TileDataVault(
                    title: "Número", subTitle: widget.addressModel.number),
            onEdit
                ? TextForm(
                    controller: neighborhoodController,
                    inputFormat: TextInputType.streetAddress,
                    text: "Bairro",
                  )
                : TileDataVault(
                    title: "Bairro",
                    subTitle: widget.addressModel.neighborhood),
            onEdit
                ? TextForm(
                    controller: cityController,
                    inputFormat: TextInputType.streetAddress,
                    text: "Cidade",
                  )
                : TileDataVault(
                    title: "Cidade", subTitle: widget.addressModel.city),
            onEdit
                ? TextForm(
                    controller: stateController,
                    inputFormat: TextInputType.streetAddress,
                    text: "Estado",
                  )
                : TileDataVault(
                    title: "Estado", subTitle: widget.addressModel.state),
            onEdit
                ? TextForm(
                    controller: countryController,
                    inputFormat: TextInputType.streetAddress,
                    text: "País")
                : TileDataVault(
                    title: "País", subTitle: widget.addressModel.country),
            Card(
              child: SizedBox(
                height: 68,
                child: onEdit
                    ? IconButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            widget.addressModel.zipCode =
                                zipCodeController.text;
                            widget.addressModel.street = streetController.text;
                            widget.addressModel.number = numberController.text;
                            widget.addressModel.neighborhood =
                                neighborhoodController.text;
                            widget.addressModel.city = cityController.text;
                            widget.addressModel.state = stateController.text;
                            widget.addressModel.country =
                                countryController.text;

                            if (widget.addressModel.id == null) {
                              await SQFLiteAddressRepository.add(
                                  widget.addressModel);
                            } else {
                              await SQFLiteAddressRepository.update(
                                  widget.addressModel);
                            }
                            widget.onChange();

                            onEdit = !onEdit;
                          }
                        },
                        icon: Icon(
                          Icons.save,
                          color: iconSelectedColor,
                        ))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            widget.onChange();
                            onEdit = !onEdit;
                          });
                        },
                        icon: Icon(
                          Icons.edit,
                          color: iconSelectedColor,
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
