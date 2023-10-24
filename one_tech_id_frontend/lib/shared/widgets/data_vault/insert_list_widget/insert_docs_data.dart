import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/user_model.dart';
import 'package:one_tech_data_control/core/data/repositories/sqflite_user_repository.dart';
import 'package:one_tech_data_control/shared/widgets/list_tile/list_tile_data_vault.dart';

import '../../text_widgets/data_text_form_field.dart';

// ignore: must_be_immutable
class DocsInsertData extends StatefulWidget {
  final VoidCallback onChange;
  UserModel userModel = UserModel(
      name: '',
      socialName: '',
      address: '',
      email: '',
      phone: '',
      cpf: '',
      rg: '',
      pis: '');

  DocsInsertData({required this.onChange, required this.userModel, super.key});

  @override
  State<DocsInsertData> createState() => _DocsInsertDataState();
}

class _DocsInsertDataState extends State<DocsInsertData> {
  static const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController cpfController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController pisController = TextEditingController();

  bool onEdit = false;

  @override
  void initState() {
    super.initState();
    cpfController.text = widget.userModel.cpf;
    rgController.text = widget.userModel.rg;
    pisController.text = widget.userModel.pis;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      width: 250,
      child: Form(
        key: formKey,
        child: ListView(children: [
          onEdit
              ? TextForm(
                  controller: cpfController,
                  inputFormat: TextInputType.number,
                  text: "CPF",
                )
              : TileDataVault(title: "CPF", subTitle: widget.userModel.cpf),
          onEdit
              ? TextForm(
                  controller: rgController,
                  inputFormat: TextInputType.number,
                  text: "RG",
                )
              : TileDataVault(title: "RG", subTitle: widget.userModel.rg),
          onEdit
              ? TextForm(
                  controller: pisController,
                  inputFormat: TextInputType.number,
                  text: "PIS",
                )
              : TileDataVault(title: "PIS", subTitle: widget.userModel.pis),
          Card(
            child: SizedBox(
                height: 68,
                child: IconButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      widget.userModel.cpf = cpfController.text;
                      widget.userModel.rg = rgController.text;
                      widget.userModel.pis = pisController.text;

                      if (widget.userModel.id == null) {
                        await SQFLiteUserRepository.add(widget.userModel);
                      } else {
                        await SQFLiteUserRepository.update(widget.userModel);
                      }
                      widget.onChange();
                      onEdit = !onEdit;
                    }
                  },
                  icon: Icon(onEdit ? Icons.save : Icons.edit,
                      color: iconSelectedColor),
                )),
          )
        ]),
      ),
    );
  }
}
