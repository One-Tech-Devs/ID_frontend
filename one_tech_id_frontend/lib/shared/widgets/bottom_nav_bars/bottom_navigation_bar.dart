import 'package:flutter/material.dart';
import 'package:one_tech_data_control/screens/access/login_screen.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  PageController pageViewController = PageController();

  BottomNavBar({required this.pageViewController, super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static const iUnselectedconColor = Color.fromARGB(255, 0, 64, 149);
  static const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);
  static const navBarColor = Color.fromARGB(255, 251, 251, 255);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
              selectedItemColor: iconSelectedColor,
              unselectedItemColor: iUnselectedconColor,
              currentIndex: widget.pageViewController.page?.round() ?? 0,
              onTap: (index) {
                widget.pageViewController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceIn);
              },
              items: [
                const BottomNavigationBarItem(
                    backgroundColor: navBarColor,
                    icon: Icon(Icons.home_filled, size: 32),
                    label: "Início",
                    activeIcon: Icon(Icons.home_filled, size: 32)),
                const BottomNavigationBarItem(
                    backgroundColor: navBarColor,
                    icon: Icon(Icons.wallet_outlined, size: 32),
                    label: "Carteira",
                    activeIcon: Icon(
                      Icons.wallet,
                      size: 32,
                    )),
                const BottomNavigationBarItem(
                    backgroundColor: navBarColor,
                    icon: Icon(Icons.history_outlined, size: 32),
                    label: "Histórico",
                    activeIcon: Icon(
                      Icons.history,
                      size: 32,
                    )),
                BottomNavigationBarItem(
                    label: "Sair",
                    icon: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      icon: const Icon(Icons.logout_outlined, size: 32),
                    )),
              ]);
        });
  }
}
