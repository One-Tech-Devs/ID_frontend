import 'package:flutter/material.dart';
import 'package:one_tech_data_control/config/colors_constant/colors_code.dart';

// ignore: must_be_immutable
class NavBarHistory extends StatefulWidget {
  PageController pageViewController = PageController();
  NavBarHistory({required this.pageViewController, super.key});

  @override
  State<NavBarHistory> createState() => _NavBarHistoryState();
}

class _NavBarHistoryState extends State<NavBarHistory> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.pageViewController,
      builder: (context, snapshot) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.pageViewController.page?.round() ?? 0,
            onTap: (index) {
              widget.pageViewController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceIn);
            },
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: IdColors.navBarColor,
                  activeIcon: Text(
                    "Pendentes",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600),
                  ),
                  icon: Text("Pendentes",
                      style: TextStyle(
                          color: IdColors.unselectedconColor,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600)),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: IdColors.navBarColor,
                  activeIcon: Text(
                    "Ativos",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600),
                  ),
                  icon: Text(
                    "Ativos",
                    style: TextStyle(
                        color: IdColors.unselectedconColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: IdColors.navBarColor,
                  activeIcon: Text(
                    "Expirados",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600),
                  ),
                  icon: Text(
                    "Expirados",
                    style: TextStyle(
                        color: IdColors.unselectedconColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  backgroundColor: IdColors.navBarColor,
                  activeIcon: Text(
                    "Rejeitadas",
                    style: TextStyle(
                        color: IdColors.selectedColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600),
                  ),
                  icon: Text(
                    "Rejeitadas",
                    style: TextStyle(
                        color: IdColors.unselectedconColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600),
                  ),
                  label: ""),
            ]);
      },
    );
  }
}
