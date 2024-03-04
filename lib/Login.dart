import 'package:flutter/material.dart';
import 'package:your_movie_app/widgets/uihelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFEEF5FF),
        body: Container(
          color: Color(0xFF176B87),
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.amber,
                  // ),
                  width: size.width * 0.4,
                  child: UiHelper.AppLogo(),
                ),
                Container(
                  child: Column(
                    children: [
                      UiHelper.CustomTextField(emailController, "Email",
                          Icons.mail, false, TextInputType.emailAddress),
                      UiHelper.CustomTextField(passwordController, "Password",
                          Icons.password, true, TextInputType.none),
                    ],
                  ),
                ),
                UiHelper.CustomButton("Login"),
                UiHelper.CustomButton("Signup"),
              ],
            ),
          ),
        ));
  }
}
