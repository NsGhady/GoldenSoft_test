import 'dart:async';
import 'package:flutter/material.dart';
import 'home_view.dart';
// ignore_for_file: prefer_const_constructors

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/diet_hub_logo.png',
          height: 300,
        ),
      ),
    );
  }
}
