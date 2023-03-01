import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phone_otp_ui/home_page/login_screen.dart';
import 'package:phone_otp_ui/phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    getName();
    super.initState();
  }

  String phone = '';
  Future getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      phone = preferences.getString('phone').toString();
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('name');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('LogOut successful'),
      ),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyPhone()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              phone,
              style: TextStyle(color: Colors.amber),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                logOut(context);
              },
              child: Text('Sign Out'))
        ],
      ),
    );
  }
}
