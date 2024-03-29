/* import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_movie_app/models/movie.dart';
import 'package:your_movie_app/services/get_movies.dart';
import 'package:your_movie_app/static.dart';
import 'package:your_movie_app/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

movingPoster(PopularMovie moviedata) {
  return Card(
      margin: EdgeInsets.only(right: 12),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Rounds the corners of the card
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(
          '${StaticValue.imageBaseUrl}${moviedata.results![0].posterPath}',
          fit: BoxFit.cover,
          height: 320,
          width: 260,
        ),
      ));
}

class HomePageState extends State<HomePage> {
  late Future<PopularMovie?> _futuremoviesdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfuturemoviesdata();
  }

  getfuturemoviesdata() {
    _futuremoviesdata = MovieService.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFEEF5FF),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Color(0xFFEEF5FF),
        toolbarHeight: 60,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: SearchWidget(
            text: "Search",
          ),
        ),
      ),
      body: Container(
        height: size.height * 0.8,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Now Trending",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF070F2B),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: size.height * 0.5,
                child: FutureBuilder<PopularMovie?>(
                  future: _futuremoviesdata,















                  child: CarouselSlider.builder(
                    itemCount: 4,
                    //scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index, realIndex) {
                      return movingPoster(PopularMovie());
                    },
                    options: CarouselOptions(
                      height: size.height * 0.45,
                      enlargeFactor: 0.00,
                      // aspectRatio: 12 / 2,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF070F2B),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "IMDb",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF070F2B),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "8.5",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Joker",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF070F2B),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    "Crime,",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Drama,",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Thriller",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


Row(
                children: [
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF070F2B),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "IMDb",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF070F2B),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "8.5",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Joker",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF070F2B),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    "Crime,",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Drama,",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Thriller",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF070F2B),
                    ),
                  ),
                ],
              )
 */