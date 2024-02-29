import 'package:flutter/material.dart';
import 'package:your_movie_app/home.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  SearchWidget({required this.text, super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: TextField(
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
            fillColor: Color(0xFF176B87),
          ),
        ),
      ),
    );
  }
}
