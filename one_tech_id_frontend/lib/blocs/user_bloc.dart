import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/subjects.dart';

import '../core/data/models/user_model.dart';

class UserBloc extends Bloc {
  UserModel? _currentUser;

  ReplaySubject<UserModel> userModelStream = ReplaySubject<UserModel>();

  void setUser(UserModel userModel) {
    _currentUser = userModel;

    userModelStream.sink.add(_currentUser!);
  }

  Stream<UserModel> get userStream => userModelStream.stream;

  UserModel get user => _currentUser!;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
