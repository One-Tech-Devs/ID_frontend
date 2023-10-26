class FilterListModel {
  String orderBy;

  FilterListModel({required this.orderBy});

  bool get ordering => orderBy.trim().isNotEmpty;
}
