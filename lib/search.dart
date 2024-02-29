import 'package:flutter/material.dart';
import 'package:your_movie_app/models/moviesId.dart';

import 'package:your_movie_app/models/searchedMovies.dart';

import 'package:your_movie_app/services/get_movies.dart';
import 'package:your_movie_app/static.dart'; // Include your API service

class SearchWidgetPage extends StatefulWidget {
  final String text;
  SearchWidgetPage({required this.text, super.key});

  @override
  State<SearchWidgetPage> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidgetPage> {
  late TextEditingController _controller;
  late Future<searchedMovies>? _futureSuggestedMovie;

  //List<Results> _suggestions = []; // List to keep the suggestions

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    getFutureSuggMovies();
  }

  getFutureSuggMovies() {
    _futureSuggestedMovie = MovieService.fetchSearchedMovies("");
  }

  // @override
  // void dispose() {
  //   _controller
  //       .dispose(); // Dispose the controller when the widget is removed from the widget tree
  //   super.dispose();
  // }

  void _onSearchChanged(String query) async {
    if (query.isNotEmpty) {
      setState(() {
        _futureSuggestedMovie = MovieService.fetchSearchedMovies(query);
      });
    } else {
      setState(() {
        getFutureSuggMovies();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEF5FF),
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: TextField(
                controller: _controller, // Use the controller here
                onChanged: _onSearchChanged, // Call the search changed handler
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: "search here",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF176B87), width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Color(0xFF176B87), width: 0),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Color(0xFF176B87),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future:
                _futureSuggestedMovie, // Your future function that fetches the suggestions
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                var _suggestions =
                    snapshot.data; // Assuming Suggestion is your data model
                return Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _suggestions!.results!.length,
                      itemBuilder: (context, index) {
                        final suggestion = _suggestions.results![index];
                        return ListTile(
                          title: Text(suggestion.title!,
                              style: TextStyle(color: Color(0xFF070F2B))),
                          onTap: () async {
                            StaticValue.selectedMovie = suggestion;
                            MoviesDetails moviesDetails =
                                await MovieService.fetchMovieId(suggestion.id!);
                            setState(() {
                              //_suggestions.results![index];
                            });
                            Navigator.pushNamed(context, 'detail',
                                arguments: moviesDetails);
                            // TODO: Navigate to movie details or fill the search bar with the movie name, etc.
                          },
                        );
                      },
                    ),
                  ),
                );
              } else {
                return Center(child: Text('No data found'));
              }
            },
          )
        ],
      ),
    );
  }
}
