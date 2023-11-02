import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:one_tech_data_control/core/data/models/address_model.dart';

class ZipCodeRepository {
  static Future<AddressModel> getZipCode(String zipCode) async {
    // ignore: unnecessary_brace_in_string_interps
    Uri uri = Uri.https("viacep.com.br", "/ws/${zipCode}/json/");

    http.Response response = await http.get(uri);
    var responseObj = jsonDecode(response.body);

    return AddressModel.fromJson(responseObj);
  }
}
