import 'package:flutter/material.dart';
import 'package:your_movie_app/bottomnav.dart';
import 'package:your_movie_app/detail.dart';
import 'package:your_movie_app/home.dart';
import 'package:your_movie_app/search.dart';
import 'package:your_movie_app/widgets/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Movie App',
      initialRoute: 'bottomnav',
      theme: ThemeData(fontFamily: 'Poppins'),
      routes: {
        'home': (context) => HomePage(),
        'detail': (context) => DetailPage(),
        'bottomnav': (context) => BottomNavBar(),
        'search': (context) => SearchWidgetPage(
              text: "Godfather",
            ),
        'profile': (context) => profilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
