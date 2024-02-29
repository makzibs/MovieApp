import 'package:flutter/material.dart';
import 'package:your_movie_app/home.dart';
import 'package:your_movie_app/models/upcomingmovies.dart';
import 'package:your_movie_app/services/get_movies.dart';
import 'package:your_movie_app/static.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DetailPage> {
  late Future<TopRated?> _futuremoviesdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfuturemoviesdata();
  }

  getfuturemoviesdata() {
    _futuremoviesdata = MovieService.fetchTopRatedMovies();
  }

  void fromTopMovieData(Results? selectedTopMovie) {
    setState(() {
      StaticValue.selectedMovie = selectedTopMovie;
    });
  }

  StaticPoster() {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Rounds the corners of the card
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            '${StaticValue.imageBaseUrl}${StaticValue.selectedMovie!.posterPath}',
            fit: BoxFit.cover,
            width: 150,
          ),
        ));
  }

  HorizontalPoster(Results moviedata) {
    return Card(
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
            width: 140,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xFFEEF5FF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Color(0xFF176B87),
              height: size.height * 0.1,
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
                      StaticValue.selectedMovie!.title!,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: size.height * 0.1,
                width: size.width,
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      StaticValue.selectedMovie!.title!,
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF070F2B),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          StaticValue.selectedMovie!.releaseDate!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF070F2B),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "1h 56m",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF070F2B),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 250,
                width: size.width,
                child: (Row(
                  children: [
                    StaticPoster(),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: Text(
                        //"During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.",
                        StaticValue.selectedMovie!.overview!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF070F2B),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 11,
                        softWrap: true,
                      ),
                    )
                  ],
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Spy",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF070F2B),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Action",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF070F2B),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Comedy",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF070F2B),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Thriller",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF070F2B),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Add to watchlist"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF176B87), // Background color
                    onPrimary: Colors.white, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFF176B87),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Top Rated Movies",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF070F2B),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: FutureBuilder<TopRated?>(
                  future: _futuremoviesdata,
                  builder: (BuildContext context,
                      AsyncSnapshot<TopRated?> snapshot) {
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
                          return Container(
                            height: size.height * 0.22,
                            width: size.width,
                            child: ListView.builder(
                              itemCount: data.results!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      fromTopMovieData(data.results![index]);
                                    });
                                  },
                                  child: HorizontalPoster(data.results![index]),
                                );
                              },
                            ),
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
              /* child: Container(
                height: size.height * 0.22,
                width: size.width,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return HorizontalPoster();
                  },
                ),
              ), */
            )
          ],
        ),
      ),
    );
  }
}
