import 'package:flutter/material.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/view/auth/signin_with_google.dart';
import 'package:furniture_store/view/auth/signup_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white, // Background color
      pages: [
        PageViewModel(
          title: "We provide high quality products just for you",
          body: "",
          image: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset('assets/Modern-Chair-PNG-HD-Quality 1.png',
                  height: 600),
            ), // Add your asset path
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: "Your satisfaction is our number one priority",
          body: "",
          image: Center(
            child: Image.asset(AppImages.image2, height: 200),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
        PageViewModel(
          title: "Let's fulfil your daily needs with us",
          body: "",
          image: Center(
            child: Image.asset(AppImages.image3, height: 200),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            bodyTextStyle: TextStyle(fontSize: 16),
          ),
        ),
      ],
      onDone: () {
        // Navigate to home or login screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SigninWithGoogle()),
        );
      },
      onSkip: () {
        // You can skip to home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignupScreen()),
        );
      },
      showSkipButton: true,
      skip: Text("Skip"),
      next: Text("Next"),
      done: Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold)),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeColor: Colors.black,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
