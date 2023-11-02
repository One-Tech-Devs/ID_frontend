import "package:bloc_provider/bloc_provider.dart";
import 'package:one_tech_data_control/core/data/repositories/mock/sqflite_mock_data/sqflite_user_repository.dart';
import 'package:rxdart/subjects.dart';

import '../core/data/models/user_model.dart';

class UserBloc extends Bloc {
  UserModel? _currentUser;

  ReplaySubject<UserModel> userModelStream = ReplaySubject<UserModel>();

  UserBloc();

  void setUser(UserModel userModel) async {
    _currentUser = await SQFLiteUserRepository.get(1);

    userModelStream.sink.add(_currentUser!);
  }

  Stream<UserModel> get userStream => userModelStream.stream;

  UserModel get user => _currentUser!;

  @override
  void dispose() {
    userModelStream.close();
  }
}
