import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_movie_app/bottomnav.dart';
import 'package:your_movie_app/models/movie.dart';
import 'package:your_movie_app/models/upcomingmovies.dart';
import 'package:your_movie_app/services/get_movies.dart';
import 'package:your_movie_app/static.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Future<PopularMovie?> _futuremoviesdata;

  static void onanimateto(int index) {
    BottomNavBarState.currentIndex = index;
    BottomNavBarState.pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void fromMovieData(Results selectedMovie) {
    StaticValue.selectedMovie = selectedMovie;
  }

  movingPoster(context, Results moviedata) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            onanimateto(2);
            fromMovieData(moviedata); // Assuming the DetailPage is at index 1
          },
          child: Card(
              margin: EdgeInsets.only(right: 12),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Rounds the corners of the card
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  '${StaticValue.imageBaseUrl}${moviedata.posterPath}',
                  fit: BoxFit.cover,
                  height: 438,
                  width: 280,
                ),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontSize: 18,
                    color: Color(0xFF070F2B),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              moviedata.voteAverage!.toStringAsFixed(1).toString(),
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF070F2B),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.75,
              child: Text(
                moviedata.title!,
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF070F2B),
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              "Crime",
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
    );
  }

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
        backgroundColor: Color(0xFF176B87),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "My",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Movies",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF070F2B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30, // Radius of the circle
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        onanimateto(1);
                      },
                      child: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: size.height * 0.8,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
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
              FutureBuilder<PopularMovie?>(
                  future: _futuremoviesdata,
                  builder: (BuildContext context,
                      AsyncSnapshot<PopularMovie?> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Container(
                            // chid text // no internet or server error
                            );
                      case ConnectionState.waiting:
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50, // Specify the width
                                height: 50, // Specify the height

                                child: CircularProgressIndicator(),
                              ),
                            ]);
                      case ConnectionState.done:
                        var data = snapshot.data;
                        if (data != null) {
                          return Row(
                            children: [
                              Container(
                                /*  decoration: BoxDecoration(
                                  color: Colors.yellow,
                                ), */
                                height: size.height * 0.67,
                                width: size.width / 1.1,
                                child: CarouselSlider.builder(
                                  itemCount: data.results!.length,

                                  //scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index, realIndex) {
                                    return movingPoster(
                                        context, data.results![index]);
                                  },
                                  options: CarouselOptions(
                                    height: size.height * 0.75,
                                    // enlargeFactor: 0.2,
                                    aspectRatio: 1 / 5,
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    disableCenter: true,
                                    padEnds: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    // enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50, // Specify the width
                                height: 50, // Specify the height

                                child: CircularProgressIndicator(),
                              ),
                            ],
                          );
                        }

                      default:
                        return Container(); // error //page
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
