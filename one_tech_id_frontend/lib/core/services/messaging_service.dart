import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:one_tech_data_control/main.dart';

class MessagingNotify {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCMToken = await _firebaseMessaging.getToken();

    // ignore: unnecessary_brace_in_string_interps
    log("Token: ${fCMToken}");
    initPushNotification();
  }

  void onClick(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed('/notification', arguments: message);
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(onClick);
    FirebaseMessaging.onMessageOpenedApp.listen(onClick);
  }
}
