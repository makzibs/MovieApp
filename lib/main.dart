import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:your_movie_app/Login.dart';
import 'package:your_movie_app/bottomnav.dart';
import 'package:your_movie_app/detail.dart';
import 'package:your_movie_app/home.dart';
import 'package:your_movie_app/search.dart';
import 'package:your_movie_app/signup.dart';
import 'package:your_movie_app/watchedlist.dart';
import 'package:your_movie_app/widgets/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Movie App',
      initialRoute: 'login',
      theme: ThemeData(fontFamily: 'Poppins'),
      routes: {
        'home': (context) => HomePage(),
        'detail': (context) => DetailPage(),
        'bottomnav': (context) => BottomNavBar(),
        'search': (context) => SearchWidgetPage(
              text: "Search your movie",
            ),
        'profile': (context) => profilePage(),
        'watchlist': (context) => MyWatchList(),
        'login': (context) => LoginPage(),
        'signup': (context) => SignUpPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
