import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/view/auth/signin_with_google.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/widget/field/custom_bottombar.dart';
import 'package:get/get.dart';

class OptionalScreen extends StatefulWidget {
  const OptionalScreen({super.key});

  @override
  State<OptionalScreen> createState() => _OptionalScreenState();
}

class _OptionalScreenState extends State<OptionalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
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
            'Optional screen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 200.h,
          ),
          ComonButton(
              title: 'User side',
              onTap: () {
                Get.to(SigninWithGoogle());
              }),
          SizedBox(
            height: 40.h,
          ),
          ComonButton(
              title: 'Admin side',
              onTap: () {
                Get.to(CustomBottombar());
              }),
        ],
      ),
    );
  }
}
