// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:donor_darah/controller/my_controller.dart';
import 'package:flutter/material.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BottomNavbarScreen extends StatefulWidget {
  final Widget body;

  const BottomNavbarScreen({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  final BottomNavbarController selectedIndexC =
      Get.put(BottomNavbarController());
  final BottomNavbarController getSelectedIndexC =
      Get.find<BottomNavbarController>();

  String _screen(int index) {
    switch (index) {
      case 0:
        return '/home-screen';
      case 1:
        return '/agenda-screen';
      case 2:
        return '/notifikasi-detail-screen';
      case 3:
        return '/profile-screen';
      default:
        return '/home-screen';
    }
  }

  void _onItemTapped(int index) {
    if (selectedIndexC.selectedIndex != index) {
      setState(() {
        int newSelectedIndex = index;
        selectedIndexC.setSelectedIndex(newSelectedIndex);
        getSelectedIndexC.selectedIndex = index;
      });

      final route = _screen(index);
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: redColor,
        unselectedItemColor: greyColor,
        showUnselectedLabels: true,
        currentIndex: getSelectedIndexC.selectedIndex,
        enableFeedback: false,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/DD48.png",
            ),
            icon: Image.asset(
              "assets/images/DD49.png",
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/Icon2.png",
            ),
            icon: Image.asset("assets/images/Icon.png"),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/DD50.png",
            ),
            icon: Image.asset(
              "assets/images/DD51.png",
            ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/DD52.png",
            ),
            icon: Image.asset("assets/images/DD53.png"),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
