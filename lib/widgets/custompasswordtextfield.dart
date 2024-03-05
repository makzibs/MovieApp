import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final IconData iconData;
  final TextInputType textInputType;

  const CustomPasswordTextField(
      {required this.controller,
      required this.text,
      required this.iconData,
      required this.textInputType,
      super.key});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: TextStyle(
          color: Color(0xFF070F2B),
          fontSize: 15,
        ),
        controller: widget.controller,
        obscureText: obscureText,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
