import 'package:flutter/material.dart';
import 'package:your_movie_app/widgets/custompasswordtextfield.dart';
import 'package:your_movie_app/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
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
                      CustomPasswordTextField(
                        controller: passwordController,
                        text: "Password",
                        iconData: Icons.password,
                        textInputType: TextInputType.none,
                      ),
                    ],
                  ),
                ),
                UiHelper.CustomButton("Signup", () async {
                  try {
                    final NewUser = await _auth.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                    Navigator.pushNamed(context, 'bottomnav');
                  } catch (e) {
                    print(e);
                  }
                }),
              ],
            ),
          ),
        ));
  }
}
