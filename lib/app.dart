import 'package:cashlink/auth/login_screen.dart';
import 'package:cashlink/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor: kWhite,
        splash: Image.asset('assets/logo.png', fit: BoxFit.contain),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
        splashIconSize: 200,
      ),
    );
  }
}
