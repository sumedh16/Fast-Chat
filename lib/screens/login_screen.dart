// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/utilities/button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool showSpinner = false;
  String emailHintText = 'Enter your email';
  String passwordHintText = 'Enter your password';
  Color hintColor = Colors.grey;

  final _auth = FirebaseAuth.instance;
  void pushtoChatScreen() async {
    await Navigator.pushNamed(context, ChatScreen.id);
    setState(() {
      emailHintText = 'Enter   Email ';
      passwordHintText = 'Enter  Password';

      email = '';
      password = '';
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                // ignore: prefer_const_constructors
                decoration: kTextFieldDecoration.copyWith(
                    hintText: emailHintText,
                    hintStyle: TextStyle(color: hintColor)),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: passwordHintText,
                    hintStyle: TextStyle(color: hintColor)),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onPress: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      pushtoChatScreen();
                    }
                    
                  } catch (e) {
                    setState(() {
                      emailHintText = 'Login failed. Enter your email-id.';
                      passwordHintText = 'Login failed . Enter your password.';
                      Future.delayed(Duration(seconds: 1));
                      showSpinner = false;
                    });
                    print(e);
                  }
                },
                buttonColor: Colors.lightBlueAccent,
                buttonText: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
