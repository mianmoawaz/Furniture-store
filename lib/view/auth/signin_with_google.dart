import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/button/common_button.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/view/auth/signup_screen.dart';
import 'package:get/get.dart';

class SigninWithGoogle extends StatefulWidget {
  const SigninWithGoogle({super.key});

  @override
  State<SigninWithGoogle> createState() => _SigninWithGoogleState();
}

class _SigninWithGoogleState extends State<SigninWithGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                AppImages.image4,
                height: 150,
              ),
            ),
          ),
          Text(
            'Let’s You in',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.image5,
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Continue with Google',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  height: 3,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.black),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'or',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 3,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          ComonButton(
            title: 'sign with password',
            onTap: () {
              Get.to(SignupScreen());
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, top: 40),
            child: Row(
              children: [
                Text('Already have an account ? '),
                GestureDetector(
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
