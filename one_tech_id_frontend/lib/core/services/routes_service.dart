import 'package:flutter/material.dart';
import 'package:one_tech_data_control/screens/access/login_screen.dart';
import 'package:one_tech_data_control/screens/home_screen.dart';
import '../../screens/history/history_landing_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/login': (_) => const LoginScreen(),
    '/home': (_) => const HomeScreen(),
    '/notification': (_) => const HistoryScreen(),
  };

  static String initial = '/login';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
