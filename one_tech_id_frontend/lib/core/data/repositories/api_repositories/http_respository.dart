import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';
import '../../../../constants/api_endpoints.dart';

class ApiRepository {
  static Future<TransactionModel> getRequest() async {
    Uri uri = Uri.https(URL_API, '/api/DataRequest');

    http.Response response = await http.get(uri);

    var responseObj = jsonDecode(response.body);

    if (response.statusCode == 200) {
      log(responseObj.toString());
      log(response.statusCode.toString());
      return TransactionModel.fromJsonApi(responseObj);
    } else {
      throw Exception("Falha na requisição");
    }
  }
}
