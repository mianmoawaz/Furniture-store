import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/widget/field/common_textfield.dart';
import 'package:furniture_store/view/auth/signin_screen.dart';
import 'package:furniture_store/widget/field/custom_bottombar.dart';
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
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController subtitlecontroller = TextEditingController();

  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLodingg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
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
              label: 'enter a name',
              prefixicon: Icons.person,
              controller: namecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: CommonTextField(
              hintText: 'Email',
              label: 'enter email',
              prefixicon: Icons.mail,
              controller: emailcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: CommonTextField(
              hintText: 'password',
              label: 'enter a password',
              prefixicon: Icons.lock,
              controller: passwordcontroller,
              validator: (Value) {
                if (Value == null || Value.isEmpty) {
                  return 'please enter your password';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: CommonTextField(
              hintText: 'confirmpassword',
              label: 'enter a confirmpassword',
              prefixicon: Icons.lock,
              controller: confirmpasswordcontroller,
              validator: (Value) {
                if (Value == null || Value.isEmpty) {
                  return 'please enter your confirm password';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ComonButton(
            title: 'sign up',
            onTap: () => signup(),
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
      ),
    ));
  }

  Future signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLodingg = true;
        });

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );

        final String userid = await FirebaseAuth.instance.currentUser!.uid;
        DocumentReference docRef =
            FirebaseFirestore.instance.collection('new collection').doc(userid);
        await docRef.set({
          'docid': docRef.id,
          'title': titlecontroller.text,
          'subtitle': subtitlecontroller.text,
          'description': descriptioncontroller.text,
          // 'email': emailcontroller.text,
          // 'name': namecontroller.text,
          // 'password': passwordcontroller.text,
          'userid': userid,
        });

        Get.to(() => CustomBottombar());
      } catch (e) {
        Get.snackbar('Error ', e.toString());
      } finally {}
    }
  }
}
