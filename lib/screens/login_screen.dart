// ignore_for_file: file_names

import 'package:bukatokoid/screens/main_screen.dart';
import 'package:bukatokoid/core/widgets.dart';
import 'package:bukatokoid/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var _passwordVisible = false;

  loginSubmit() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen())));
    } catch (e) {
      print(e);
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(48, 48, 48, 0),
            child: SingleChildScrollView(
                child: Container(
              color: Colors.white,
              height: 800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    "assets/img/logo.png",
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login",
                    style: titleText(),
                  ),
                  PrimaryForm(
                    controller: _emailController,
                    hintText: "Username",
                    prefixIcon: Icons.person,
                  ),
                  PrimaryForm(
                    controller: _passwordController,
                    isObscure: true,
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    suffixIcon1: Icons.visibility,
                    suffixIcon2: Icons.visibility_off,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          child: Text(
                            "Forgot Password?",
                            style: linkText(),
                          ),
                          onTap: () {})),
                  PrimaryButton(
                      text: "Login",
                      onPressed: () {
                        loginSubmit();
                      }),
                  const Text("Or Login With"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 60,
                          height: 60,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            "assets/images/google.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Image.asset(
                          "assets/images/linkedin.png",
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      InkWell(
                          child: Text(
                            "Register Here",
                            style: linkText(),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RegisterScreen();
                            }));
                          }),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
