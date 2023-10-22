import 'package:flutter/material.dart';
import '../shared/widgets/bottom_nav_bars/bottom_navigation_bar.dart';
import 'data_vault/data_vault_lading_page.dart';
import 'history/history_landing_page.dart';
import 'home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final pageViewController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications,
                  size: 32, color: Color.fromARGB(255, 0, 64, 149)),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 32,
                    color: Color.fromARGB(255, 0, 64, 149),
                  )),
            )
          ]),
      body: PageView(controller: pageViewController, children: [
        const HomeScreen(),
        const DataVaultScreen(),
        const HistoryScreen()
      ]),
      bottomNavigationBar: BottomNavBar(pageViewController: pageViewController),
    );
  }
}
