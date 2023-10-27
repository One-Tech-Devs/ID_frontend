import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:provider/provider.dart';
import '../core/services/notification_service.dart';
import '../shared/widgets/streams_builder/hello_stream.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelloStreamWidget(),
            SizedBox(
              height: 25,
            ),
            Text(
              "Nenhuma solicitação encontrada",
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                  color: IdColors.selectedColor),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    valor = !valor;
                  });
                },
                child: Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
