import 'dart:developer';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/blocs/notify_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'blocs/user_bloc.dart';
import 'firebase_options.dart';
import 'screens/access/login_screen.dart';
import 'core/services/messaging_service.dart';
import 'core/services/notification_service.dart';
import 'screens/access/onboarding_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Handling a background message");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await MessagingNotify().initNotifications();

  // runApp(IDApp());
  runApp(MultiProvider(providers: [
    Provider<NotificationService>(
      create: (context) => NotificationService(),
    )
  ], child: IDApp(showHome: showHome)));
}

class IDApp extends StatelessWidget {
  final bool showHome;
  const IDApp({required this.showHome, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      creator: (context, bag) => UserBloc(),
      child: BlocProvider<NotifyBloc>(
        creator: (context, bag) => NotifyBloc(),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: showHome ? const LoginScreen() : const OnBoardScreen(),
        ),
      ),
    );
  }
}
