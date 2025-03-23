import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/constants/app_colors.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/widget/field/common_textfield.dart';
import 'package:furniture_store/widget/field/custom_bottombar.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    label: 'enter a email',
                    hintText: 'Email',
                    prefixicon: Icons.mail,
                    controller: emailcontroller,
                    validator: (Value) {
                      if (Value == '' || Value == null) {
                        return 'please enter your email';
                      }
                      return null;
                    }),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CommonTextField(
                  label: 'enter a password',
                  hintText: 'Password',
                  prefixicon: Icons.lock,
                  controller: passwordcontroller,
                  isPassword: true,
                  validator: (Value) {
                    if (Value == '' || Value == null) {
                      return 'please enter your password';
                    }
                    return null;
                  },
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
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        setState(() {
                          isloading = true;
                        });
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text);
                        Get.to(CustomBottombar());
                        setState(() {
                          isloading = false;
                        });
                      } on FirebaseAuthException catch (e) {
                        Get.snackbar('Error', e.toString(),
                            backgroundColor: AppColors.red);
                        setState(() {
                          isloading = false;
                        });
                      }
                    }
                  }),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
