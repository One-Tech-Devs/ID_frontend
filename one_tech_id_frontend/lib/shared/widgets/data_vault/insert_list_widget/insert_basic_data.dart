import 'package:flutter/material.dart';
import 'package:one_tech_data_control/core/data/models/user_model.dart';
import 'package:one_tech_data_control/core/data/repositories/sqflite_user_repository.dart';
import 'package:one_tech_data_control/shared/widgets/list_tile/list_tile_data_vault.dart';

import '../../text_widgets/data_text_form_field.dart';

// ignore: must_be_immutable
class BasicInsertData extends StatefulWidget {
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

  BasicInsertData({required this.userModel, required this.onChange, super.key});

  @override
  State<BasicInsertData> createState() => _BasicInsertDataState();
}

class _BasicInsertDataState extends State<BasicInsertData> {
  static const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController socialNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool onEdit = false;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userModel.name;
    socialNameController.text = widget.userModel.socialName;
    phoneController.text = widget.userModel.phone;
    emailController.text = widget.userModel.email;
  }

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
                      controller: nameController,
                      inputFormat: TextInputType.name,
                      text: "Nome",
                    )
                  : TileDataVault(
                      title: "Nome", subTitle: widget.userModel.name),
              onEdit
                  ? TextForm(
                      controller: socialNameController,
                      inputFormat: TextInputType.name,
                      text: "Nome Social",
                    )
                  : TileDataVault(
                      title: "Nome Social",
                      subTitle: widget.userModel.socialName),
              onEdit
                  ? TextForm(
                      controller: phoneController,
                      inputFormat: TextInputType.phone,
                      text: "Telefone",
                    )
                  : TileDataVault(
                      title: "Telefone", subTitle: widget.userModel.phone),
              onEdit
                  ? TextForm(
                      controller: emailController,
                      inputFormat: TextInputType.emailAddress,
                      text: "E-Mail",
                    )
                  : TileDataVault(
                      title: "E-Mail", subTitle: widget.userModel.email),
              Card(
                child: SizedBox(
                  height: 68,
                  child: IconButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        widget.userModel.name = nameController.text;
                        widget.userModel.socialName = socialNameController.text;
                        widget.userModel.phone = phoneController.text;
                        widget.userModel.email = emailController.text;

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
                  ),
                ),
              )
            ],
          )),
    );
  }
}
