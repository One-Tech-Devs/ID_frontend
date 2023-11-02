import 'dart:developer';

import 'package:bloc_provider/bloc_provider.dart';

import 'package:one_tech_data_control/core/data/models/transaction_model.dart';
import 'package:one_tech_data_control/core/data/repositories/mock/firebase_mock_repo/notify_firestore_repository.dart';
import 'package:rxdart/subjects.dart';
import '../core/services/notification_service.dart';

class NotifyBloc extends Bloc {
  NotificationService notificationService = NotificationService();
  TransactionModel? _currentTransaction;

  ReplaySubject<TransactionModel> transactionModelStream =
      ReplaySubject<TransactionModel>();

  ReplaySubject<TransactionModel> notificationStream =
      ReplaySubject<TransactionModel>();

  ReplaySubject<List<TransactionModel>> listTransactionModelStream =
      ReplaySubject<List<TransactionModel>>();

  void setTransaction(TransactionModel transactionModel) {
    _currentTransaction = transactionModel;
    transactionModelStream.sink.add(_currentTransaction!);
  }

  Stream<TransactionModel> get transactionStream =>
      transactionModelStream.stream;

  Stream<List<TransactionModel>> get listTransactionStream =>
      listTransactionModelStream;

  TransactionModel get transaction => _currentTransaction!;

  NotifyBloc() {
    //stream sink para novos pendentes.
    NotifyMockRepository.listenList((p0) {
      if (p0.isNotEmpty) {
        transactionModelStream.sink.add(
            p0.firstWhere((element) => element.requestStatus == "pending"));
      }
    });

    //stream sink para notificação
    NotifyMockRepository.listenList((p0) {
      if (p0.isNotEmpty) {
        notificationStream.sink.add(p0.last);
      }
    });

    //stream sink para histórico
    NotifyMockRepository.listenList((p0) {
      if (p0.isNotEmpty) listTransactionModelStream.sink.add(p0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
