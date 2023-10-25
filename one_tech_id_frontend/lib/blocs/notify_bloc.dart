import 'package:bloc_provider/bloc_provider.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';
import 'package:one_tech_data_control/core/data/repositories/mock/firebase_mock_repo/notify_firestore_repository.dart';
import 'package:rxdart/subjects.dart';

class NotifyBloc extends Bloc {
  TransactionModel? _currentTransaction;

  ReplaySubject<TransactionModel> transactionModelStream =
      ReplaySubject<TransactionModel>();

  ReplaySubject<List<TransactionModel>> listTransactionModelStream =
      ReplaySubject<List<TransactionModel>>();

  void setTransaction(TransactionModel transactionModel) {
    _currentTransaction = transactionModel;
    transactionModelStream.sink.add(_currentTransaction!);
  }

  Stream<TransactionModel> get transactionStream =>
      transactionModelStream.stream;

  TransactionModel get transaction => _currentTransaction!;

  NotifyBloc() {
    NotifyMockRepository.listenList((p0) {
      if (p0.isNotEmpty) transactionModelStream.sink.add(p0.last);
    });

    NotifyMockRepository.listenList((p0) {
      if (p0.isNotEmpty) listTransactionModelStream.sink.add(p0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
