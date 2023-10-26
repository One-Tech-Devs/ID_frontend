// import 'dart:async';

// import 'package:bloc_provider/bloc_provider.dart';
// import 'package:one_tech_data_control/core/data/models/transaction_model.dart';

// import '../core/data/repositories/mock/firebase_mock_repo/notify_firestore_repository.dart';

// class FilterBloc extends Bloc {
//   StreamController<FilterListModel> _filterController =
//       StreamController.broadcast();

//   Stream<FilterListModel> get filterStream => _filterController.stream;

//   Future<List<TransactionModel>> orderByCompany() {
//     List<TransactionModel> filteredList = [];
//     NotifyMockRepository.listenList((p0) => filteredList.add(p0));

//     filteredList.sort((a, b) => a.requester.compareTo(b.requester));

//     return filteredList.sort().then(_filterController.sink.add(filteredList));
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//   }
// }
