import 'package:one_tech_data_control/constants/db_table_const.dart';

class UserModel {
  int? id;
  String name;
  String socialName;
  String address;
  String email;
  int phone;
  String cpf;
  String rg;
  String pis;

  UserModel(
      {required this.id,
      required this.name,
      required this.socialName,
      required this.address,
      required this.email,
      required this.phone,
      required this.cpf,
      required this.rg,
      required this.pis});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      USER_FIELD_NAME: name,
      USER_FIELD_SOCIAL_NAME: socialName,
      USER_FIELD_CPF: cpf,
      USER_FIELD_RG: rg,
      USER_FIELD_ADDRESS: address,
      USER_FIELD_EMAIL: email,
      USER_FIELD_PHONE: phone,
      USER_FIELD_PIS: pis,
    };

    if (id != null) {
      json[USER_FIELD_ID] = id;
    }

    return json;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[USER_FIELD_ID],
      name: json[USER_FIELD_NAME] ?? '',
      socialName: json[USER_FIELD_SOCIAL_NAME] ?? '',
      address: json[USER_FIELD_ADDRESS] ?? '',
      email: json[USER_FIELD_EMAIL] ?? '',
      phone: json[USER_FIELD_PHONE] ?? '',
      cpf: json[USER_FIELD_CPF] ?? '',
      rg: json[USER_FIELD_RG] ?? '',
      pis: json[USER_FIELD_PIS] ?? '',
    );
  }
}
