import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/constants/app_colors.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/utils/snackbar_util.dart';
import 'package:furniture_store/view/auth/forgot_password.dart';
import 'package:furniture_store/view/auth/signup_screen.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/widget/field/common_textfield.dart';
import 'package:furniture_store/widget/field/custom_bottombar.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool isLodingg = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  label: 'Enter Email',
                  hintText: 'Email',
                  prefixicon: Icons.mail,
                  controller: emailController,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CommonTextField(
                  label: 'Enter Password',
                  hintText: 'Password',
                  prefixicon: Icons.lock,
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                  onTap: () {
                    Get.to(ForgotPassword());
                  },
                  child: Text('forgot password?')),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    Text('Remember me'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ComonButton(
                isLoding: isLodingg,
                title: 'Sign In',
                onTap: () => signin(_formKey),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 65),
                child: Row(
                  children: [
                    Text('Don’t have an account? '),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      child: Text(
                        'Sign Up',
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

  Future signin(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLodingg = true;
        });

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        SnackbarUtil.showSuccess("Login Successful!");
        Get.to(() => CustomBottombar());
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', e.message ?? "Login failed!",
            backgroundColor: AppColors.red);
      } finally {
        setState(() {
          isLodingg = false;
        });
      }
    }
  }
}
