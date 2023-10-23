import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/address_model.dart';
import 'package:one_tech_data_control/core/data/repositories/sqflite_address_repository.dart';
import '../../text_widgets/data_text_form_field.dart';

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

  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _zipCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _streetController.text = widget.addressModel.street;
    _numberController.text = widget.addressModel.number;
    _neighborhoodController.text = widget.addressModel.neighborhood;
    _cityController.text = widget.addressModel.city;
    _stateController.text = widget.addressModel.state;
    _countryController.text = widget.addressModel.country;
    _zipCodeController.text = widget.addressModel.zipCode;
  }

  @override
  void dispose() {
    _streetController.dispose();
    _numberController.dispose();
    _neighborhoodController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  bool onEdit = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: formKey,
      children: [
        TextForm(
          controller: _zipCodeController,
          inputFormat: TextInputType.number,
          text: "CEP",
        ),
        TextForm(
          controller: _streetController,
          inputFormat: TextInputType.streetAddress,
          text: "Rua",
        ),
        TextForm(
          controller: _numberController,
          inputFormat: TextInputType.number,
          text: "Número",
        ),
        TextForm(
          controller: _neighborhoodController,
          inputFormat: TextInputType.streetAddress,
          text: "Bairro",
        ),
        TextForm(
          controller: _cityController,
          inputFormat: TextInputType.streetAddress,
          text: "Cidade",
        ),
        TextForm(
          controller: _stateController,
          inputFormat: TextInputType.streetAddress,
          text: "Estado",
        ),
        TextForm(
            controller: _countryController,
            inputFormat: TextInputType.streetAddress,
            text: "País"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 85),
          child: SizedBox(
            height: 35,
            child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    widget.addressModel.street = _streetController.text;
                    widget.addressModel.number = _numberController.text;
                    widget.addressModel.neighborhood =
                        _neighborhoodController.text;
                    widget.addressModel.city = _cityController.text;
                    widget.addressModel.state = _stateController.text;
                    widget.addressModel.country = _countryController.text;

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
    );
  }
}
