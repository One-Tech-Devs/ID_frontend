import 'package:flutter/material.dart';

import '../../screens/access/login_screen.dart';

void main() {
  runApp(IDApp());
}

class IDApp extends StatelessWidget {
  const IDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: LoginScreen(),
    );
  }
}
