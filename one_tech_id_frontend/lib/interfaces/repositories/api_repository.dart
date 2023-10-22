import '../../core/data/models/user_model.dart';

const String API_URL = "";

abstract class IRepository {
  Future<void> getAll();

  Future<UserModel?> getById();

  Future<void> delete();

  Future<void> update();

  Future<UserModel?> add();
}
