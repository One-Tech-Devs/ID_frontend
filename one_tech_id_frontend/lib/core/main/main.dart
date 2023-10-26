import 'package:bloc_provider/bloc_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_tech_data_control/blocs/notify_bloc.dart';
import '../../blocs/user_bloc.dart';
import '../../firebase_options.dart';
import '../../screens/access/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(IDApp());
  // runApp(MultiProvider(providers: [
  //   Provider<NotificationService>(
  //     create: (context) => NotificationService(),
  //   )
  // ], child: const IDApp()));
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
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
