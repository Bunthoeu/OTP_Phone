import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp_ui/home_page/home_page.dart';
import 'package:phone_otp_ui/phone.dart';
import 'package:phone_otp_ui/splash_screen.dart';
import 'package:phone_otp_ui/verify.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
 SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.get('phone');

  runApp(MaterialApp(
    initialRoute: 'slapsh',
    debugShowCheckedModeBanner: false,
    routes: {
       'slapsh': (context) => SplashScreen(),
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home': (context) => HomePage()
    },
  ));
}
