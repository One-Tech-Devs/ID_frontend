import 'package:bloc_provider/bloc_provider.dart';
import 'package:one_tech_data_control/core/data/models/transaction_model.dart';
import 'package:rxdart/subjects.dart';

class NotifyBloc extends Bloc {
  TransactionModel? _currentTransaction;

  ReplaySubject<TransactionModel> transactionModelStream =
      ReplaySubject<TransactionModel>();

  void setTransaction(TransactionModel transactionModel) {
    _currentTransaction = transactionModel;
    transactionModelStream.sink.add(_currentTransaction!);
  }

  Stream<TransactionModel> get transactionStream =>
      transactionModelStream.stream;

  TransactionModel get transaction => _currentTransaction!;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
