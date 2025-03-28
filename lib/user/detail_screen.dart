import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/constants/app_icons.dart';
import 'package:furniture_store/user/cart.dart';
import 'package:furniture_store/user/update.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Map<String, dynamic> arguments;

  @override
  void initState() {
    super.initState();
    arguments = Get.arguments ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.shopping_bag_outlined, size: 30.sp),
              ),
              SizedBox(height: 50.h),
              GestureDetector(
                onTap: () {
                  Get.to(Update(), arguments: {
                    'title': arguments['title'],
                    'description': arguments['description'],
                    'docid': arguments['docid'],
                  });
                },
                child: Icon(
                  AppIcons.edit,
                  size: 30,
                ),
              ),
              Text(
                arguments['title'] ?? 'No Title',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Text(
                arguments['description'] ?? 'No Description',
                style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
              ),
              SizedBox(height: 20.h),
              Center(
                child: ComonButton(
                  title: 'Add to Cart',
                  onTap: () {
                    Get.to(() => Cart());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
