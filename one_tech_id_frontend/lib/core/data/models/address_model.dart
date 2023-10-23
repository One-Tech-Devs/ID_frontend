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
  String ibge = '';
  String gia = '';
  String ddd = '';
  String siafi = '';

  AddressModel(
      {this.id,
      required this.street,
      required this.number,
      required this.neighborhood,
      required this.city,
      required this.state,
      required this.country,
      required this.zipCode,
      required this.ddd,
      required this.gia,
      required this.ibge,
      required this.siafi});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      ADDRESS_FIELD_STREET: street,
      ADDRESS_FIELD_NUMBER: number,
      ADDRESS_FIELD_NEIGHBORHOOD: neighborhood,
      ADDRESS_FIELD_CITY: city,
      ADDRESS_FIELD_STATE: state,
      ADDRESS_FIELD_COUNTRY: country,
      ADDRESS_FIELD_ZIP: zipCode,
      ADDRESS_FIELD_DDD: ddd,
      ADDRESS_FIELD_GIA: gia,
      ADDRESS_FIELD_IBGE: ibge,
      ADDRESS_FIELD_SIAFI: siafi,
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
    ddd = json[ADDRESS_FIELD_DDD] ?? '';
    gia = json[ADDRESS_FIELD_GIA] ?? '';
    ibge = json[ADDRESS_FIELD_IBGE] ?? '';
    siafi = json[ADDRESS_FIELD_SIAFI] ?? '';
  }
}
