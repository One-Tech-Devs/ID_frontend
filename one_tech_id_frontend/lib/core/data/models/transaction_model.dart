import '../../../constants/db_table_const.dart';

class TransactionModel {
  String? id = '';
  String requester = '';
  String requestData = '';
  String requestDate = '';
  String requestUntil = '';
  String requestStatus = '';

  TransactionModel(
      {this.id,
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
      REQUEST_FIELD_REQUESTE_UNTIL: requestUntil,
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
    requestData = json[REQUESTED_DATA] ?? '';
    requestDate = json[REQUESTED_DATE] ?? '';
    requestUntil = json[REQUESTED_UNTIL] ?? '';
    requestStatus = json[REQUEST_STATUS] ?? '';
  }
}
