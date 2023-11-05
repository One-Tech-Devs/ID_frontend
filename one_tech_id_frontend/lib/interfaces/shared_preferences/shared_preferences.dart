import 'package:shared_preferences/shared_preferences.dart';

class CachedLogin {
  String credentialCpf;
  String credentialPassword;

  CachedLogin({required this.credentialCpf, required this.credentialPassword});

  factory CachedLogin.getCredentials(String cpf, String password) {
    return CachedLogin(credentialCpf: cpf, credentialPassword: password);
  }

  Future<List<String>> toCache() async {
    List<String> list = [];
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("credentials", list);
    return list;
  }
}
