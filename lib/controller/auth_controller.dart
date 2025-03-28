import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/constants/app_colors.dart';
import 'package:furniture_store/models/user_model.dart';
import 'package:furniture_store/utils/snackbar_util.dart';
import 'package:furniture_store/widget/field/custom_bottombar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();

  RxBool isloading = false.obs;
  RxBool rememberMe = false.obs;

  Future signup(formkey) async {
    if (formkey.currentState!.validate()) {
      try {
        isloading.value = true;
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: PasswordController.text,
        );

        final String userid = await FirebaseAuth.instance.currentUser!.uid;
        DocumentReference docRef = FirebaseFirestore.instance
            .collection('furniture store')
            .doc(userid);

        UserModel userModel = UserModel(
            userId: userid,
            name: nameController.text,
            email: emailController.text,
            profileImage: '');

        await docRef.set(userModel.toFirestore());
        isloading.value = false;
        Get.to(() => CustomBottombar());
      } catch (e) {
        Get.snackbar('Error ', e.toString());
        isloading.value = false;
      }
    }
  }

  Future signin(formKey) async {
    if (formKey.currentState!.validate()) {
      try {
        isloading.value = true;

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: PasswordController.text,
        );

        SnackbarUtil.showSuccess("Login Successful!");

        Get.to(() => CustomBottombar());
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', e.message ?? "Login failed!",
            backgroundColor: AppColors.red);
      } finally {
        isloading.value = false;
      }
    }
  }
}
