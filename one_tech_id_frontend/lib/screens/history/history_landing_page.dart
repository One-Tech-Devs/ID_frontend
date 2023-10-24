import 'package:flutter/material.dart';
import 'package:one_tech_data_control/shared/widgets/bottom_nav_bars/bottom_navigation_bar_history.dart';
import '../../shared/widgets/history/active_history.dart';
import '../../shared/widgets/history/expired_history.dart';
import '../../shared/widgets/history/pending_history.dart';

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
        children: const [PendingHistory(), ActiveHistory(), ExpiredHistory()],
      ),
      bottomNavigationBar:
          NavBarHistory(pageViewController: pageViewController),
    );
  }
}
