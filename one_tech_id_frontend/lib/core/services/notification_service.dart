import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('background');

  void initialNotification() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max, priority: Priority.max);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        0, "Title", "Olá Mundo!", notificationDetails);
  }
}

//   NotificationService() {
//     localNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     _setupNotifications();
//   }

//   _setupNotifications() async {
//     await _initializeNotifications();
//   }

//   _initializeNotifications() async {
//     //setup para Android
//     const android = AndroidInitializationSettings("@mipmap/launcher_icon");
//     await localNotificationsPlugin.initialize(
//       const InitializationSettings(
//         android: android,
//       ),
//       onDidReceiveNotificationResponse: _onSelectNotification,
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//   }

//   _onSelectNotification(String? payload) {
//     if (payload != null && payload.isNotEmpty) {
//       Navigator.of(Routes.navigatorKey!.currentContext!)
//           .pushReplacementNamed(payload);
//     }
//   }

//   showNotification(CustomNotification notification) {
//     androidNotificationDetails = const AndroidNotificationDetails(
//       "lembretes_notification",
//       "Lembretes",
//       channelDescription: "Lembretes passam por aqui",
//       importance: Importance.max,
//       priority: Priority.max,
//       enableVibration: true,
//       enableLights: true,
//     );

//     localNotificationsPlugin.show(
//         notification.id,
//         notification.title,
//         notification.body,
//         NotificationDetails(android: androidNotificationDetails),
//         payload: notification.payload);
//   }

//   checkForNotifications() async {
//     final details =
//         await localNotificationsPlugin.getNotificationAppLaunchDetails();
//     if (details != null && details.didNotificationLaunchApp) {
//       _onSelectNotification(details);
//     }
//   }
// }
