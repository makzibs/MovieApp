import 'package:flutter/material.dart';
import 'package:your_movie_app/home.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key});

  @override
  State<MyWatchList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Container(
        child: Column(
          children: [
            Container(
              color: Color(0xFF176B87),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        HomePageState.onanimateto(0);
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      "My watch list",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
