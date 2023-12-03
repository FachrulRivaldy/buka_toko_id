import 'package:bukatokoid/screens/login_screen.dart';
import 'package:bukatokoid/core/widgets.dart';
import 'package:bukatokoid/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _passwordVisible = false;

  registerSubmit() async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    await _firestore.collection('users').doc(userCredential.user?.uid).set({
      'name': _nameController.text,
      'phone': _phoneController.text,
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BukaToko',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 48)),
                    Text('ID',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 48)),
                  ],
                ),
                Text("Register Form", style: titleText()),
                PrimaryForm(
                  controller: _nameController,
                  hintText: "Name",
                  prefixIcon: Icons.person,
                ),
                PrimaryForm(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: "Phone",
                  prefixIcon: Icons.phone,
                ),
                PrimaryForm(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  prefixIcon: Icons.mail,
                ),
                PrimaryForm(
                  controller: _passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isObscure: _passwordVisible,
                  suffixIcon1: Icons.visibility,
                  suffixIcon2: Icons.visibility_off,
                ),
                PrimaryButton(
                  onPressed: () {
                    registerSubmit();
                    Get.toNamed('/login');
                  },
                  text: "Register",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }));
                      },
                      child: Text("Login Here", style: linkText()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
