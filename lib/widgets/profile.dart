import 'package:flutter/material.dart';
import 'package:your_movie_app/home.dart';
import 'package:your_movie_app/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => profilePageState();
}

class profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: Color(0xFFEEF5FF),
        ),
        child: Column(
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
                      "Profile",
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
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: size.height * 0.4,
                width: size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF176B87),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 0, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: Offset(
                          0, 5), // Horizontal and vertical offset of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60, // Radius of the circle
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Makzibs Anil",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Tampere, Finland",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.school,
                        color: Color(0xFF176B87),
                        size: 40,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "School",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Tampere University",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w200),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xFF176B87),
                        size: 40,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nick Name",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Mak",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w100),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.contact_phone,
                        color: Color(0xFF176B87),
                        size: 40,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "+358413170401",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    ],
                  ),
                  UiHelper.CustomButton(
                    "Logout",
                    () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, 'login');
                    },
                    color: Color(0xFF176B87),
                    textcolor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
