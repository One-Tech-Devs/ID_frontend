import '../../../constants/api_endpoints.dart';
import '../../../constants/db_table_const.dart';

class TransactionModel {
  String? id = '';
  String? clientId = '';
  String requester = '';
  String requestData = '';
  String requestDate = '';
  String requestUntil = '';
  String requestStatus = '';

  TransactionModel(
      {this.id,
      this.clientId,
      required this.requestData,
      required this.requester,
      required this.requestDate,
      required this.requestUntil,
      required this.requestStatus});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      REQUEST_FIELD_REQUESTER: requester,
      REQUEST_FIELD_REQUEST_DATA: requestData,
      REQUEST_FIELD_REQUEST_DATE: requestDate,
      REQUEST_FIELD_REQUEST_UNTIL: requestUntil,
      REQUEST_FIELD_STATUS: requestStatus
    };

    if (id != null) {
      json[REQUEST_FIELD_ID];
    }

    return json;
  }

  TransactionModel.fromJson(Map<String, dynamic> json, String idRequest) {
    id = idRequest;
    requester = json[REQUESTER] ?? '';
    requestData = json[REQUEST_DATA] ?? '';
    requestDate = json[REQUEST_DATE] ?? '';
    requestUntil = json[REQUEST_UNTIL] ?? '';
    requestStatus = json[REQUEST_STATUS] ?? '';
  }

  TransactionModel.fromJsonApi(Map<String, dynamic> json) {
    id = json[API_ID] ?? '';
    clientId = json[API_CLIENT_ID] ?? '';
    requester = json[API_REQUESTER] ?? '';
    requestData = json[API_REQUESTED_DATA] ?? '';
    requestDate = json[API_REQUESTED_DATE] ?? '';
    requestUntil = json[API_REQUESTED_UNTIL] ?? '';
    requestStatus = json[API_REQUESTED_STATUS] ?? '';
  }
}
