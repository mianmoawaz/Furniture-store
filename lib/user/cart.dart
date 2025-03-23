import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/user/checkout_results.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<int> quantities = [];

  @override
  void initState() {
    super.initState();
    int itemCount = 7;
    quantities = List.generate(itemCount, (index) => 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30.sp,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '  Order reviews',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('     ${quantities.length} items in cart'),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.h),
              itemCount: quantities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  leading: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(Icons.inventory_2_outlined,
                        size: 30.sp, color: Colors.grey),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amet nunc, tincidunt',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'interdum rhoncus massa',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantities[index] > 1) quantities[index]--;
                            });
                          },
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          quantities[index].toString(),
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 12.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantities[index]++;
                            });
                          },
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Text(
                                '+',
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantities.removeAt(index);
                          });
                        },
                        child:
                            Icon(Icons.close, size: 18.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '\$245.78',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ComonButton(
              title: 'Next',
              onTap: () {
                Get.to(CheckoutResults());
              }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
