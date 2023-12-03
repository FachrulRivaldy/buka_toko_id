import 'package:bukatokoid/screens/login_screen.dart';
import 'package:bukatokoid/screens/main_screen.dart';
import 'package:bukatokoid/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    autoLogin();
    super.initState();
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString("user-token");
    if (userToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed('/main');
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed('/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('BukaToko',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 48)),
          Text('ID',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 48)),
        ],
      ),
    ));
  }
}
