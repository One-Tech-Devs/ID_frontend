import 'package:one_tech_data_control/constants/db_table_const.dart';

class UserModel {
  int? id;
  String password;
  String securityPhrase;
  String name;
  String socialName;
  String addressId;
  String email;
  String phone;
  String cpf;
  String rg;
  String pis;

  UserModel(
      {this.id,
      required this.password,
      required this.securityPhrase,
      required this.name,
      required this.socialName,
      required this.addressId,
      required this.email,
      required this.phone,
      required this.cpf,
      required this.rg,
      required this.pis});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      USER_FIELD_PASSWORD: password,
      USER_FIELD_SECURITY_PHRASE: securityPhrase,
      USER_FIELD_NAME: name,
      USER_FIELD_SOCIAL_NAME: socialName,
      USER_FIELD_CPF: cpf,
      USER_FIELD_RG: rg,
      USER_FIELD_ADDRESS_ID: addressId,
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
      password: json[USER_FIELD_PASSWORD] ?? '',
      securityPhrase: json[USER_FIELD_SECURITY_PHRASE] ?? '',
      name: json[USER_FIELD_NAME] ?? '',
      socialName: json[USER_FIELD_SOCIAL_NAME] ?? '',
      addressId: json[USER_FIELD_ADDRESS_ID] ?? '',
      email: json[USER_FIELD_EMAIL] ?? '',
      phone: json[USER_FIELD_PHONE] ?? '',
      cpf: json[USER_FIELD_CPF] ?? '',
      rg: json[USER_FIELD_RG] ?? '',
      pis: json[USER_FIELD_PIS] ?? '',
    );
  }

  factory UserModel.fromJsonApi(Map<String, dynamic> json) {
    return UserModel(
        id: json[USER_FIELD_ID] ?? '',
        password: json[USER_FIELD_PASSWORD] ?? '',
        securityPhrase: json[USER_FIELD_SECURITY_PHRASE],
        name: json[USER_FIELD_NAME] ?? '',
        socialName: json[USER_FIELD_SOCIAL_NAME] ?? '',
        addressId: json[USER_FIELD_ADDRESS_ID] ?? '',
        email: json[USER_FIELD_EMAIL] ?? '',
        phone: json[USER_FIELD_PHONE] ?? '',
        cpf: json[USER_FIELD_CPF] ?? '',
        rg: json[USER_FIELD_RG] ?? '',
        pis: json[USER_FIELD_PIS] ?? '');
  }

  @override
  String toString() {
    return "UserModel(password: password, securityPhrase: securityPhrase, name: name, socialName: socialName, addressId: addressId, email: email, phone: phone, cpf: cpf, rg: rg, pis: pis)";
  }
}
