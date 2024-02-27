import 'package:your_movie_app/models/upcomingmovies.dart';

class StaticValue {
  static String apikey = "c14c15c28109f082c13fc95d04b65361";
  static String ReadAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMTRjMTVjMjgxMDlmMDgyYzEzZmM5NWQwNGI2NTM2MSIsInN1YiI6IjY1ZDJlZjE2MjhkN2ZlMDE0OTM0NDRmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1i2acStIfdOf0nkvxnSbb274Zw8W7ytFMky2QMlCUCg";

  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static Results? selectedMovie = null;
}
