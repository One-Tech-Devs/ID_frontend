import 'package:one_tech_data_control/core/services/login/login_service.dart';
import '../../core/data/models/user_model.dart';

abstract class LoginCallBack {
  void onLoginSuccess(UserModel user);
  void onLoginError(String error);
}

class LoginResponse {
  LoginCallBack _callBack;
  LoginRequest loginRequest = LoginRequest();
  LoginResponse(this._callBack);

  doLogin(String cpf, String password) {
    loginRequest
        .getLogin(cpf, password)
        .then((user) => _callBack.onLoginSuccess(user))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  }
}
