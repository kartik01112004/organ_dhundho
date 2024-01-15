import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';
import '../utils/colors.dart';
import '../utils/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: SweetNavBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          SweetNavBarItem(
            sweetIcon: const Icon(
              FontAwesomeIcons.droplet,
            ),
            sweetLabel: '',
          ),
          SweetNavBarItem(
            sweetIcon: const Icon(
              FontAwesomeIcons.building,
              color: secondaryColor,
            ),
            sweetLabel: '',
          ),
          SweetNavBarItem(
            sweetIcon: const Icon(
              FontAwesomeIcons.plus,
              color: secondaryColor,
            ),
            sweetLabel: '',
          ),
          SweetNavBarItem(
            sweetIcon: const Icon(
              FontAwesomeIcons.person,
              color: secondaryColor,
            ),
            sweetLabel: '',
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
