import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/user/cart.dart';
import 'package:get/get.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int selectedColorIndex = 0;

  final List<Color> availableColors = [
    Colors.green,
    Colors.grey,
    Colors.white,
    Colors.black,
  ];

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
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30.sp,
                ),
              ),
              SizedBox(height: 70.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CHAIR',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Green\n Armchair',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'From',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '\$289.99',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Available Colors',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: List.generate(availableColors.length,
                                  (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColorIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: availableColors[index],
                                      shape: BoxShape.circle,
                                      border: selectedColorIndex == index
                                          ? Border.all(
                                              color: Colors.black, width: 2)
                                          : null,
                                    ),
                                    child: selectedColorIndex == index
                                        ? Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 18.sp,
                                          )
                                        : null,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Image.asset(
                              'assets/Image.png',
                              height: 300.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                'Tieton Armchair',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                  'This armchair is an elegant and functional piece of\n furniture. It is suitable for family visits and parties\n with friends and perfect for relaxing in front of the\n TV after hard work.'),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: ComonButton(
                    title: 'add to cart',
                    onTap: () {
                      Get.to(Cart());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
