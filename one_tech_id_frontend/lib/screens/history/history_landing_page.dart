import 'package:flutter/material.dart';
import 'package:one_tech_data_control/shared/widgets/bottom_nav_bars/bottom_navigation_bar_history.dart';
import '../../shared/widgets/streams_builder/request_builder_stream.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: const [
          StreamRequestsBuilder(
            status: "pending",
            onEmptyList:
                "Você não possui nenhuma solicitação pendente no momento. \nNão se preocupe, nós notificaremos quando aparecerem novas solicitações.",
          ),
          StreamRequestsBuilder(
              status: "active",
              onEmptyList: "Nenhum dado seu está sendo compartilhado. \n"
                  "Você pode acessar a aba expirados aqui no histórico para verificar quais foram os seus ultimos dados compartilhados"),
          StreamRequestsBuilder(
            status: "expired",
            onEmptyList: "Você ainda não possui compartilhamentos expirados. \n"
                "Quando algum compartilhamento expirar, você será avisado e será possível verificar aqui neste local a lista de expirados.",
          ),
          StreamRequestsBuilder(
            status: "rejected",
            onEmptyList: "Você ainda não rejeitou nenhuma solicitação. \n"
                "As suas solicitações rejeitas serão colocadas aqui.",
          ),
        ],
      ),
      bottomNavigationBar:
          NavBarHistory(pageViewController: pageViewController),
    );
  }
}
