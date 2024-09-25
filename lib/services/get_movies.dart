import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:your_movie_app/models/moviesId.dart';
import 'package:your_movie_app/models/searchedMovies.dart';
import 'package:your_movie_app/models/upcomingmovies.dart';

import 'package:your_movie_app/static.dart';
import 'package:your_movie_app/models/movie.dart';

class MovieService {
  static Future<PopularMovie> fetchMovies() async {
    final response = await http.get(
      Uri.parse(
        '${StaticValue.baseUrl}/movie/popular?api_key=${StaticValue.apikey}',
      ),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //final List<dynamic> results = data['results'];
      final moviedata = PopularMovie.fromJson(data);
      //return results.map((json) => Movie.fromJson(json)).toList();
      return moviedata;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  static Future<TopRated> fetchTopRatedMovies() async {
    final response = await http.get(
      Uri.parse(
        '${StaticValue.baseUrl}/movie/top_rated?api_key=${StaticValue.apikey}',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final moviedata = TopRated.fromJson(data);
      return moviedata;
    } else {
      throw Exception('Failed to fetch the movies');
    }
  }

  static Future<searchedMovies> fetchSearchedMovies(String query) async {
    final response = await http.get(
      Uri.parse(
        '${StaticValue.baseUrl}/search/movie?api_key=${StaticValue.apikey}&query=${Uri.encodeComponent(query)}',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final moviedata = searchedMovies.fromJson(data);
      return moviedata;
    } else {
      throw Exception('Failed to fetch the movies');
    }
  }

  static Future<MoviesDetails> fetchMovieId(int movieId) async {
    final response = await http.get(
      Uri.parse(
        '${StaticValue.baseUrl}/movie/${movieId}?api_key=${StaticValue.apikey}',
      ),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final moviedata = MoviesDetails.fromJson(data);
      return moviedata;
    } else {
      throw Exception('Failed to fetch the movies');
    }
  }
}
