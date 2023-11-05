import 'package:one_tech_data_control/core/data/repositories/mock/sqflite_mock_data/sqflite_user_repository.dart';
import '../../data/models/user_model.dart';

class LoginRequest {
  Future<UserModel> getLogin(String cpf, String password) {
    var result = SQFLiteUserRepository.getLogin(cpf, password);
    return result;
  }
}
