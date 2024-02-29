import 'package:flutter/material.dart';
import 'package:your_movie_app/detail.dart';
import 'package:your_movie_app/home.dart';
import 'package:your_movie_app/search.dart';
import 'package:your_movie_app/watchedlist.dart';
import 'package:your_movie_app/widgets/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  static PageController pageController = PageController();
  static int currentIndex = 0;

  final screens = [
    HomePage(),
    SearchWidgetPage(text: "Godfather"),
    MyWatchList(),
    profilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // body: screens[currentIndex],
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          HomePage(),
          SearchWidgetPage(text: "Godfather"),
          MyWatchList(),
          profilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            activeIcon: Icon(Icons.home_filled),
            backgroundColor: Color(0xFF176B87),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
            backgroundColor: Color(0xFF176B87),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'profile',
            backgroundColor: Color(0xFF176B87),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
            backgroundColor: Color(0xFF176B87),
          ),
        ],
        currentIndex: currentIndex,
        showSelectedLabels: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            BottomNavBarState.pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          });
        },
      ),
    );
  }
}
