import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/address_model.dart';
import 'package:one_tech_data_control/core/data/repositories/sqflite_address_repository.dart';
import '../text_widgets/data_text_form_field.dart';

class AddressInsertData extends StatefulWidget {
  final AddressModel addressModel;
  final VoidCallback onChange;
  const AddressInsertData(
      {required this.addressModel, required this.onChange, super.key});

  @override
  State<AddressInsertData> createState() => _AddressInsertDataState();
}

class _AddressInsertDataState extends State<AddressInsertData> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final streetController = TextEditingController();
  final numberController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipCodeController = TextEditingController();

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
    return Form(
      key: formKey,
      child: ListView(
        children: [
          TextForm(
            controller: zipCodeController,
            inputFormat: TextInputType.number,
            text: "CEP",
          ),
          TextForm(
            controller: streetController,
            inputFormat: TextInputType.streetAddress,
            text: "Rua",
          ),
          TextForm(
            controller: numberController,
            inputFormat: TextInputType.number,
            text: "Número",
          ),
          TextForm(
            controller: neighborhoodController,
            inputFormat: TextInputType.streetAddress,
            text: "Bairro",
          ),
          TextForm(
            controller: cityController,
            inputFormat: TextInputType.streetAddress,
            text: "Cidade",
          ),
          TextForm(
            controller: stateController,
            inputFormat: TextInputType.streetAddress,
            text: "Estado",
          ),
          TextForm(
              controller: countryController,
              inputFormat: TextInputType.streetAddress,
              text: "País"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 85),
            child: SizedBox(
              height: 35,
              child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      widget.addressModel.street = streetController.text;
                      widget.addressModel.number = numberController.text;
                      widget.addressModel.neighborhood =
                          neighborhoodController.text;
                      widget.addressModel.city = cityController.text;
                      widget.addressModel.state = stateController.text;
                      widget.addressModel.country = countryController.text;

                      if (widget.addressModel.id == null) {
                        await SQFLiteAddressRepository.add(widget.addressModel);
                      } else {
                        await SQFLiteAddressRepository.update(
                            widget.addressModel);
                      }
                      widget.onChange();
                    }
                  },
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
