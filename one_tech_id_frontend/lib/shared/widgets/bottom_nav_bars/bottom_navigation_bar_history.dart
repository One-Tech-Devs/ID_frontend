import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavBarHistory extends StatefulWidget {
  PageController pageViewController = PageController();
  NavBarHistory({required this.pageViewController, super.key});

  @override
  State<NavBarHistory> createState() => _NavBarHistoryState();
}

class _NavBarHistoryState extends State<NavBarHistory> {
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
              BottomNavigationBarItem(
                  backgroundColor: navBarColor,
                  icon: const Text("Pendentes",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500)),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: navBarColor,
                  icon: const Text(
                    "Ativos",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: navBarColor,
                  icon: const Text(
                    "Expirados",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500),
                  ),
                  label: ""),
            ]);
      },
    );
  }
}
