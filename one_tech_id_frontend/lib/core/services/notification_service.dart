import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../constants/db_table_const.dart';
import 'routes_service.dart';

class CustomNotification {
  final int id;
  final String? title;
  final String? body;
  final String? payload;

  CustomNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.payload});
}

class NotificationService {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationDetails androidNotificationDetails;

  NotificationService() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  _setupNotifications() async {
    await _initializeNotifications();
  }

  _initializeNotifications() async {
    //setup para Android
    const android = AndroidInitializationSettings("@mipmap/launcher_icon");
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onSelectNotification: _onSelectNotification,
    );

    //inicializa dentro do metodo de inicilização do service de notificaçãos o serviço de push notificatios
    //que escuta as alterações no firestore
    Stream<QuerySnapshot<Map<String, dynamic>>> notificationStream =
        FirebaseFirestore.instance
            .collection(REQUEST_COLLECTION)
            .where(REQUEST_STATUS, isEqualTo: "pending")
            .snapshots();
    notificationStream.listen((event) {
      if (event.docs.isEmpty) {
        return;
      }
      showRequestNotification(event.docs.last);
    });
  }

  _onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.of(Routes.navigatorKey!.currentContext!)
          .pushReplacementNamed(payload);
    }
  }

  showNotification(CustomNotification notification) {
    androidNotificationDetails = const AndroidNotificationDetails(
      "lembretes_notification",
      "Lembretes",
      channelDescription: "Lembretes passam por aqui",
      importance: Importance.max,
      priority: Priority.max,
      icon: "@mipmap/ic_launcher",
      enableVibration: true,
      enableLights: true,
    );

    flutterLocalNotificationsPlugin.show(
        notification.id,
        notification.title,
        notification.body,
        NotificationDetails(android: androidNotificationDetails),
        payload: notification.payload);
  }

  //função que será inicializada no _initialize(), setar priority para max
  //e importance para max, se não estiver no grau de importância max, a notificação não será exibida como push notification.
  showRequestNotification(QueryDocumentSnapshot<Map<String, dynamic>> event) {
    androidNotificationDetails = const AndroidNotificationDetails(
        'request', 'notification',
        channelDescription: "Notify the User",
        channelShowBadge: true,
        enableLights: true,
        enableVibration: true,
        priority: Priority.max,
        importance: Importance.max,
        icon: "@mipmap/launcher_icon");
    NotificationDetails details =
        NotificationDetails(android: androidNotificationDetails);
    flutterLocalNotificationsPlugin.show(
        01, event.get("requester"), event.get("requested_data"), details);
  }

  checkForNotifications() async {
    final details =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onSelectNotification(details.payload);
    }
  }
}
