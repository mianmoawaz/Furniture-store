import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_store/view/auth/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Text(
              'Welcome to online furniture store',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
