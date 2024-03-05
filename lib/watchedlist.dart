import 'package:flutter/material.dart';
import 'package:your_movie_app/detail.dart';

import 'package:your_movie_app/models/upcomingmovies.dart';
import 'package:your_movie_app/static.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key});

  @override
  State<MyWatchList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWatchList> {
  // final List<Results> _watchListedMov = [];
  final List<Results> _watchListedMovies = DemoPageState.watchListedMov;

  void initState() {
    super.initState();
    // Check if StaticValue.selectedMovie is not null
    // if (StaticValue.selectedMovie != null) {
    //   // If StaticValue.selectedMovie is not null, add it to _watchListedMov
    //   //addMovie(StaticValue.selectedMovie!);
    // }
  }

  void _deleteMovie(Results results) {
    setState(() {
      _watchListedMovies.remove(results);
    });
  }

  // void addMovie(Results results) {
  //   setState(() {
  //     _watchListedMov.add(results);
  //   });
  // }

  // void _deleteMovie(Results results) {
  //   setState(() {
  //     _watchListedMov.remove(results);
  //   });
  // }

  watchListMovies(index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFF176B87), // Adjust the value as needed
          // You can also add other decorations like color, boxShadow, etc.
        ),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  '${StaticValue.imageBaseUrl}${_watchListedMovies[index].posterPath}',
                  fit: BoxFit.cover,
                  width: 140,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(
                      _watchListedMovies[index].title!,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _deleteMovie(_watchListedMovies[index]);
                      },
                      child: Container(
                        width: 20,
                        child: Icon(
                          Icons.delete,
                          size: 24, // Adjust the size as needed
                          color:
                              Color(0xFF176B87), // Adjust the color as needed
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF176B87),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      // HomePageState.onanimateto(0);
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'bottomnav', (route) => false);
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
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: _watchListedMovies.length,
                itemBuilder: (context, index) {
                  return watchListMovies(index);
                }),
          )
        ],
      )),
    );
  }
}
