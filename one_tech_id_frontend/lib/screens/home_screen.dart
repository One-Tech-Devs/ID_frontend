import 'package:flutter/material.dart';
import 'package:one_tech_data_control/shared/widgets/cards/request_notification_card.dart';
import '../shared/widgets/streams_builder/hello_stream.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HelloStreamWidget(),
            // SizedBox(
            //   height: 25,
            // ),
            // Text(
            //   "Nenhuma solicitação encontrada",
            //   style: TextStyle(
            //       fontSize: 22,
            //       fontFamily: "Roboto",
            //       fontWeight: FontWeight.w600),
            // ),
            RequestNotificationCard()
          ],
        ),
      ),
    );
  }
}
