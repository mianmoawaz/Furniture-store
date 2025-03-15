import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/button/common_button.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/field/common_textfield.dart';
import 'package:furniture_store/view/auth/signin_screen.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              AppImages.image4,
              height: 150,
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Create your account',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: CommonTextField(
            hintText: 'Name',
            prefixicon: Icons.person,
            controller: namecontroller,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: CommonTextField(
            hintText: 'Email',
            prefixicon: Icons.mail,
            controller: emailcontroller,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: CommonTextField(
            hintText: 'password',
            prefixicon: Icons.lock,
            controller: passwordcontroller,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: CommonTextField(
            hintText: 'confirmpassword',
            prefixicon: Icons.lock,
            controller: confirmpasswordcontroller,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        ComonButton(
          title: 'sign up',
          onTap: () {
            Get.to(SigninScreen());
          },
        ),
        SizedBox(
          height: 20,
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
          height: 20,
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
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 80,
          ),
          child: Row(
            children: [
              Text('Already have an account ? '),
              GestureDetector(
                  onTap: () {
                    Get.to(() => SigninScreen());
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
        ),
      ]),
    ));
  }
}
