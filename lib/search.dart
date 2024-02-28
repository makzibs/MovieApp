import 'package:flutter/material.dart';
import 'package:your_movie_app/models/searchedMovies.dart';
import 'package:your_movie_app/models/upcomingmovies.dart';
import 'package:your_movie_app/services/get_movies.dart'; // Include your API service

class SearchWidgetPage extends StatefulWidget {
  final String text;
  SearchWidgetPage({required this.text, super.key});

  @override
  State<SearchWidgetPage> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidgetPage> {
  late TextEditingController _controller;
  late Future<searchedMovies> _futureSuggestedMovie;
  List<Results> _suggestions = []; // List to keep the suggestions

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    getFutureSuggMovies();
  }

  getFutureSuggMovies() {
    _futureSuggestedMovie = MovieService.fetchSearchedMovies("Godfather");
  }

  // @override
  // void dispose() {
  //   _controller
  //       .dispose(); // Dispose the controller when the widget is removed from the widget tree
  //   super.dispose();
  // }

  void _onSearchChanged(String query) async {
    if (query.isNotEmpty) {
      // Call your API service to fetch suggestions
      final searchedMoviessuggestions =
          await MovieService.fetchSearchedMovies(query);
      //setState(() => _suggestions = searchedMoviessuggestions);
      setState(() {
        _suggestions = searchedMoviessuggestions.results ?? [];
      });
    } else {
      setState(
          () => _suggestions = []); // Clear suggestions when query is empty
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                color: Color(0xFF070F2B),
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintText: widget.text,
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
                fillColor: Color(0xFF9BB8CD),
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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _suggestions!.results!.length,
                    itemBuilder: (context, index) {
                      final suggestion = _suggestions.results![index];
                      return ListTile(
                        title: Text(suggestion.title!,
                            style: TextStyle(color: Color(0xFF070F2B))),
                        onTap: () {
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
    );
  }
}
