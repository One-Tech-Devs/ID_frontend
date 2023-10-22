import 'package:flutter/material.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/nav_bar_text.dart';

// ignore: must_be_immutable
class NavBarDataVault extends StatefulWidget {
  PageController pageViewController = PageController();
  NavBarDataVault({required this.pageViewController, super.key});

  @override
  State<NavBarDataVault> createState() => _NavBarDataVaultState();
}

class _NavBarDataVaultState extends State<NavBarDataVault> {
  static const iUnselectedconColor = Color.fromARGB(255, 0, 64, 149);
  static const iconSelectedColor = Color.fromARGB(255, 255, 87, 23);
  static const navBarColor = Color.fromARGB(255, 251, 251, 255);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.pageViewController,
      builder: (context, snapshot) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
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
                  icon: const TextNavBar(text: "Dados básicos"),
                  activeIcon: const TextNavBar(text: "Dados básicos"),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: navBarColor,
                  icon: const TextNavBar(text: "Endereço"),
                  activeIcon: const TextNavBar(text: "Endereço"),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: navBarColor,
                  activeIcon: const TextNavBar(text: "Documentos"),
                  icon: const TextNavBar(text: "Documentos"),
                  label: "")
            ]);
      },
    );
  }
}
