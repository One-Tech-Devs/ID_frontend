import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import '../core/data/repositories/api_repositories/http_respository.dart';
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HelloStreamWidget(),
            FutureBuilder(
              future: ApiRepository.getRequest(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (!snapshot.hasData) {
                  return LinearProgressIndicator();
                }

                return Center();
              },
            )
            // const SizedBox(
            //   height: 25,
            // ),
            // const Text(
            //   "Tudo certo por aqui. Você não possui solicitações pendentes.",
            //   style: TextStyle(
            //       fontSize: 22,
            //       fontFamily: "Roboto",
            //       fontWeight: FontWeight.w600,
            //       color: IdColors.selectedColor),
            // ),
            // const SizedBox(
            //   height: 25,
            // ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 105, vertical: 35),
            //   child: SizedBox(
            //     height: 175,
            //     child: Center(
            //       child: Image.asset("assets/app/ID_marcadagua.png"),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
