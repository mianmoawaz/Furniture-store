import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/widget/field/common_textfield2.dart';
import 'package:furniture_store/user/billing.dart';
import 'package:get/get.dart';

class CheckoutResults extends StatefulWidget {
  const CheckoutResults({super.key});

  @override
  State<CheckoutResults> createState() => _CheckoutResultsState();
}

class _CheckoutResultsState extends State<CheckoutResults> {
  bool _rememberMe = false;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController codecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController provincecontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 320.h,
                ),
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 30.sp,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Billing Address',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    label: 'First Name',
                    hint: 'Alex',
                    controller: namecontroller,
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CommonTextField(
                    label: 'Last Name',
                    hint: 'Driver',
                    controller: namecontroller,
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CommonTextField(
              label: 'email address',
              hint: 'abcd@gmail.com',
              controller: emailcontroller,
              validator: (Value) {
                if (Value == '' || Value == null) {
                  return 'please enter your email';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CommonTextField(
              label: 'streat address',
              hint: 'home adress',
              controller: addresscontroller,
              validator: (Value) {
                if (Value == '' || Value == null) {
                  return 'please enter your address';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    label: 'zip code',
                    hint: 'code',
                    controller: codecontroller,
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your code';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CommonTextField(
                    label: 'Phone Number',
                    hint: '+92.......',
                    controller: numbercontroller,
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    label: 'province',
                    hint: 'province',
                    controller: provincecontroller,
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your province';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CommonTextField(
                    label: 'city',
                    hint: 'city',
                    controller: citycontroller,
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your city';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
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
                  Text('My billing and shipping\n address are same'),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            ComonButton(
                title: 'Next',
                onTap: () {
                  Get.to(Billing());
                })
          ],
        ),
      ),
    );
  }
}
