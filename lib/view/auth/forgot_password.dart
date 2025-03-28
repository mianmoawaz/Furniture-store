import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/view/auth/signin_screen.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/widget/field/common_textfield2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(child: Image.asset(AppImages.image4)),
          ),
          Text(
            'Forgot password',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CommonTextField(
                label: 'enter your email',
                controller: emailController,
                hint: 'email',
                validator: (value) {
                  if (value == '' || value == null) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              )),
          SizedBox(
            height: 60.h,
          ),
          ComonButton(
              title: 'Next',
              onTap: () {
                Get.to(SigninScreen());
              })
        ],
      ),
    );
  }
}
