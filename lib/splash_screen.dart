import 'dart:async';


import 'package:flutter/material.dart';
import 'package:phone_otp_ui/home_page/login_screen.dart';
import 'package:phone_otp_ui/phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatorToLoginScreen();
  }

  _navigatorToLoginScreen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final phone = preferences.get('phone');
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>phone==null? LoginScreen():HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: Image.asset('assets/img1.png'),
          ),
          Text(
            'catpro merchant'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )
        ],
      )),
    );
  }
}
