import 'package:bloc_provider/bloc_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/blocs/notify_bloc.dart';
import 'package:provider/provider.dart';
import '../../blocs/user_bloc.dart';
import '../../firebase_options.dart';
import '../../screens/access/login_screen.dart';
import '../services/messaging_service.dart';
import '../services/notification_service.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await MessagingNotify().initNotifications();

  // runApp(IDApp());
  runApp(MultiProvider(providers: [
    Provider<NotificationService>(
      create: (context) => NotificationService(),
    )
  ], child: const IDApp()));
}

class IDApp extends StatelessWidget {
  const IDApp({super.key});

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
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
