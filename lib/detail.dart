import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:your_movie_app/home.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DemoPageState();
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
        child: Image.asset(
          'assets/Joker.jpg',
          fit: BoxFit.cover,
          width: 150,
        ),
      ));
}

HorizontalPoster() {
  return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Rounds the corners of the card
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(
          'assets/Joker.jpg',
          fit: BoxFit.cover,
          width: 140,
        ),
      ));
}

class _DemoPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xFFB5C0D0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Color(0xFF818FB4),
            height: size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    "Joker",
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
                  Text(
                    "Joker",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "2021",
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
                      "During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF070F2B),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 14,
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Action",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Comedy",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Thriller",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
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
                  primary: Colors.white, // Background color
                  onPrimary: Color(0xFF070F2B), // Text color
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
                    color: Color(0xFF070F2B),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Cast",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Container(
              width: size.width,
              child: Text(
                "TOP SERIES CAST",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF070F2B),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Container(
              height: size.height * 0.18,
              width: size.width,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HorizontalPoster();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
