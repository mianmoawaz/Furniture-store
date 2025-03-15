import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/button/common_button.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/field/common_textfield.dart';
import 'package:furniture_store/user/home_screen.dart';
import 'package:furniture_store/view/auth/signup_screen.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: 20.h),
            Text(
              'Create your account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CommonTextField(
                hintText: 'Email',
                prefixicon: Icons.mail,
                controller: emailcontroller,
              ),
            ),
            SizedBox(height: 20.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CommonTextField(
                hintText: 'Password',
                prefixicon: Icons.lock,
                controller: passwordcontroller,
                isPassword: true,
              ),
            ),
            SizedBox(height: 20.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value!;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
            ),
            SizedBox(height: 10),

            ComonButton(
              title: 'Sign In',
              onTap: () {
                Get.to(() => HomeScreen());
              },
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.black, thickness: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.black, thickness: 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            // Sign-up Link
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Row(
                children: [
                  Text('Do not have an account? '),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
