import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import '../blocs/notify_bloc.dart';
import '../core/data/models/transaction_model.dart';
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
    return Stack(
      children: [
        Center(
          child: Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/app/ID_marcadagua.png'),
                      fit: BoxFit.cover))),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HelloStreamWidget(),
                  const Gap(65),
                  StreamBuilder(
                      stream: BlocProvider.of<NotifyBloc>(context)
                          .listTransactionModelStream,
                      builder: (context, snapshot) {
                        String status = 'pending';
                        List<TransactionModel> requestList = [];

                        if (snapshot.hasData) {
                          for (int i = 0; i < snapshot.data!.length; i++) {
                            if (snapshot.data![i].requestStatus
                                    .trim()
                                    .toLowerCase() ==
                                status.toLowerCase()) {
                              requestList.add(snapshot.data![i]);
                              requestList.sort(
                                (a, b) => a.requester.compareTo(b.requester),
                              );
                            }
                          }
                        }

                        if (!snapshot.hasData || snapshot.data == null) {
                          return const Text(
                            "Você tem novas solicitações, vá até a aba de solicitações para verificá-las.",
                            style: TextStyle(
                                fontSize: 28,
                                color: IdColors.selectedColor,
                                fontFamily: "Roboto"),
                          );
                        }
                        return const Text(
                            "Nenhuma solicitação por enquanto, fique tranquilo nós te avisaremos quando ",
                            style: TextStyle(
                                fontSize: 28,
                                color: IdColors.unselectedconColor,
                                fontFamily: "Roboto"));
                      }),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
