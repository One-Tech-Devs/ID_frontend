class TransactionModel {
  int? id;
  List<String> requestedData;
  String requester;

  TransactionModel(
      {required this.id, required this.requestedData, required this.requester});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        id: json["id"] ?? 0,
        requestedData: json["requestedData"] ?? [],
        requester: json["requester"]);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "requester": requester,
      "requestedData": requestedData,
    };
    return json;
  }
}
