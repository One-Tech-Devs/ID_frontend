import 'dart:developer';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await _auth.authenticate(
          options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              sensitiveTransaction: true),
          localizedReason:
              "Utilize a sua impressão digital para acessar o aplicativo",
          authMessages: const [
            AndroidAuthMessages(
                signInTitle: "Efetuar login",
                cancelButton: "Cancelar Login",
                biometricHint: ""),
            IOSAuthMessages(cancelButton: "Cancelar login"),
          ]);
    } catch (e) {
      log("Erro ao realizar autenticação: $e");
      return false;
    }
  }
}
