import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';
import 'package:one_tech_data_control/shared/widgets/text_widgets/nav_bar_text.dart';

// ignore: must_be_immutable
class NavBarDataVault extends StatefulWidget {
  PageController pageViewController = PageController();
  NavBarDataVault({required this.pageViewController, super.key});

  @override
  State<NavBarDataVault> createState() => _NavBarDataVaultState();
}

class _NavBarDataVaultState extends State<NavBarDataVault> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.pageViewController,
      builder: (context, snapshot) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: IdColors.selectedColor,
            unselectedItemColor: IdColors.unselectedconColor,
            currentIndex: widget.pageViewController.page?.round() ?? 0,
            onTap: (index) {
              widget.pageViewController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceIn);
            },
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: IdColors.navBarColor,
                  icon: Text(
                    "Dados básicos",
                    style: TextStyle(
                        color: IdColors.unselectedconColor,
                        fontWeight: FontWeight.w600),
                  ),
                  activeIcon: Text(
                    "Dados básicos",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontWeight: FontWeight.w600),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: IdColors.navBarColor,
                  icon: Text(
                    "Endereço",
                    style: TextStyle(
                        color: IdColors.unselectedconColor,
                        fontWeight: FontWeight.w600),
                  ),
                  activeIcon: Text(
                    "Endereço",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontWeight: FontWeight.w600),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: IdColors.navBarColor,
                  activeIcon: Text(
                    "Documentos",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontWeight: FontWeight.w600),
                  ),
                  icon: Text(
                    "Documentos",
                    style: TextStyle(
                        color: IdColors.unselectedconColor,
                        fontWeight: FontWeight.w600),
                  ),
                  label: "")
            ]);
      },
    );
  }
}
