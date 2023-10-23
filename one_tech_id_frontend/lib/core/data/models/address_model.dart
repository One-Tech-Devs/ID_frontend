import 'package:one_tech_data_control/constants/db_table_const.dart';

class AddressModel {
  int? id;
  String street = '';
  String number = '';
  String neighborhood = '';
  String city = '';
  String state = '';
  String country = '';
  String zipCode = '';

  AddressModel({
    this.id,
    required this.street,
    required this.number,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      ADDRESS_FIELD_STREET: street,
      ADDRESS_FIELD_NUMBER: number,
      ADDRESS_FIELD_NEIGHBORHOOD: neighborhood,
      ADDRESS_FIELD_CITY: city,
      ADDRESS_FIELD_STATE: state,
      ADDRESS_FIELD_COUNTRY: country,
      ADDRESS_FIELD_ZIP: zipCode,
    };

    if (id != null) {
      json[ADDRESS_FIELD_ID] = id;
    }

    return json;
  }

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json[ADDRESS_FIELD_ID];
    street = json[ADDRESS_FIELD_STREET] ?? '';
    number = json[ADDRESS_FIELD_NUMBER] ?? '';
    neighborhood = json[ADDRESS_FIELD_NEIGHBORHOOD] ?? '';
    city = json[ADDRESS_FIELD_CITY] ?? '';
    state = json[ADDRESS_FIELD_STATE] ?? '';
    country = json[ADDRESS_FIELD_COUNTRY] ?? '';
    zipCode = json[ADDRESS_FIELD_ZIP] ?? '';
  }
}
