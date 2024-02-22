import 'package:flutter/material.dart';
import 'package:your_movie_app/home.dart';

class SearchWidget extends StatefulWidget {
  String text;
  SearchWidget({required this.text, super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: TextStyle(
            color: Color(0xFFB5C0D0),
            fontSize: 24,
          ),
          suffixIcon: Icon(
            Icons.search,
            size: 50,
            color: Color(0xFFB5C0D0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
