import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makeframes/screens/bottomnav/provider/bottomnav_provdr.dart';
import 'package:makeframes/screens/homescreen/view/homesccreen.dart';
import 'package:makeframes/screens/search/searchscreen.dart';
import 'package:makeframes/screens/settingsscreen/settings_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  int currentIndex = 0;

  List<Widget> pages = [
     HomeScreen(),
    const SearchScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(1),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(children: [
              Consumer<BottomNavProvider>(builder: (context, value, child) {
                return BottomNavigationBar(
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 27,
                      ),
                      activeIcon: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 27,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.search_circle,
                        color: Colors.white,
                        size: 27,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.search_circle_fill,
                        color: Colors.white,
                        size: 27,
                      ),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.settings,
                        color: Colors.white,
                      ),
                      label: 'Settings',
                    ),
                  ],
                  currentIndex: value.currentIndex,
                  onTap: (index) {
                    currentIndex = index;
                    value.currentIndex = currentIndex;
                  },
                );
              }),
            ]),
          ),
        ),
        body: pages[value.currentIndex],
      );
    });
  }
}
