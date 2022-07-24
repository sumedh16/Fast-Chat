// ignore_for_file: prefer_const_constructors

import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/utilities/button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation; //to use  curves

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1), upperBound: 1.0, vsync: this);

    controller.forward();
    /*  
      to reverse the animation :-
          controller.reverse(from:1.0); 
    */
    controller.addListener(() {
      setState(() {
        // print(animation.value);
      });
    });
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // animation.addStatusListener((status) {print(status);});

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      // backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: controller.value * 100,
                  // height: 80.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              // ignore: prefer_const_constructors
              AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 60),
                animatedTexts: [
                  TypewriterAnimatedText(
                    speed: const Duration(milliseconds: 300),
                    'Fast Chat',
                    textStyle: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.6),
                  ),
                ],
              ),
            ]),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                onPress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                buttonColor: Colors.lightBlueAccent,
                buttonText: Text('Log In')),
            RoundedButton(
                onPress: () {
                  //Go to registration screen.
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                buttonColor: Colors.blueAccent,
                buttonText: Text('Register'))
          ],
        ),
      ),
    );
  }
}
