import 'package:flutter/material.dart';
import 'package:your_movie_app/detail.dart';
import 'package:your_movie_app/home.dart';
import 'package:your_movie_app/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [HomePage(), DetailPage(), HomePage(), HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            activeIcon: Icon(Icons.home_filled),
            backgroundColor: Color(0xFF818FB4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
            backgroundColor: Color(0xFF818FB4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'profile',
            backgroundColor: Color(0xFF818FB4),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
            backgroundColor: Color(0xFF818FB4),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
