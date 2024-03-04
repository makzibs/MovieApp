import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller, String text,
      IconData icondata, bool tohide, TextInputType textInputType) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(
          color: Color(0xFF070F2B),
          fontSize: 15,
        ),
        controller: controller,
        obscureText: tohide,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(icondata),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  static AppLogo() {
    return Row(
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
    );
  }

  static CustomButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF070F2B),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
