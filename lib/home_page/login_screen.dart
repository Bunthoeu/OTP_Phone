import 'dart:async';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/home_page.dart';
import 'funtions.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferences? localStorege;
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isture = false;
  var _text = '';
  var _password = '';

  @override
  void initState() {
    super.initState();
    isture = true;
  }

  void startTimer() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => phone == '' ? LoginScreen() : HomePage(),
              ),
            ));
  }

  String? get _errorText {
    final text = _controller.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
  }

  String? get _errorPassword {
    final textPassword = _passwordController.value.text;
    if (textPassword.isEmpty) {
      return 'Can\'t be empty';
    }
    if (textPassword.length < 4) {
      return 'Too short';
    }
    return null;
  }

  var phone = '';
  var passowrd = '112233';
  void _saveForm() async {
    intl();

    final isValid = _formKey.currentState!.validate();

    if (phone == _controller.text && passowrd == _passwordController.text) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
     var phone= preferences.get('phone');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login successful'),
        ),
      );
      startTimer();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please Check Your Login')));
    }
    // localStorege!.setString('name', _controller.text.toString());
    // localStorege!.setString('password', _passwordController.text.toString());
  }

  Future intl() async {
    localStorege = await SharedPreferences.getInstance();
  }

// then, in the build method:

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text('Username or Email'),
            SizedBox(
              height: 8,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  //  errorText: _errorText,
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(width: 2, color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  // String pattern =
                  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  // RegExp regex = RegExp(pattern);
                  if (text!.isEmpty) {
                    return 'Text is empty';
                  } else if (text.length < 2) {
                    return 'Username must be at least 3 characters long.';
                  } else if (_controller.text != phone) {
                    return 'Icorrect Username or Email';
                  }

                  return null;
                },
              ),
            ),
            // validator: validateEmail,
            //   // validator: (text) {
            //   //   if (text == null || text.isEmpty) {
            //   //     return 'Text is empty';
            //   //   }
            //   //   return null;
            //   // },
            //   onChanged: (text) => setState(() => _text),
            //   controller: _controller,
            //   decoration: InputDecoration(
            //     // errorText: _errorText,
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(16)),
            //       borderSide: BorderSide(
            //         color: Colors.black,
            //         width: 2,
            //       ),
            //     ),
            //     border: InputBorder.none,
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(16)),
            //       borderSide: BorderSide(
            //         color: Colors.black,
            //         width: 2,
            //       ),
            //     ),
            //   ),

          
            SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            actionButton(
                onClicked: () {
                  _saveForm();
                },
                text: 'Login')
          ],
        ),
      )),
    );
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }
}
