import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/user/home_screen.dart';
import 'package:furniture_store/view/auth/onboarding_page.dart';
import 'package:furniture_store/view/auth/signin_with_google.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    bool isOnboardingPly = box.read('onboarding') ?? false;
    User? user = FirebaseAuth.instance.currentUser;

    if (!isOnboardingPly) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnboardingPage()),
      );
    } else if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SigninWithGoogle()),
      );
    }
  }

  // @override
  // void initState() {
  //   super.initState();

  //   Timer(const Duration(seconds: 5), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const OnboardingPage()),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 30),
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
