import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/constants/app_images.dart';
import 'package:furniture_store/user/home_screen.dart';
import 'package:furniture_store/widget/button/common_button.dart';
import 'package:furniture_store/widget/field/common_textfield2.dart';
import 'package:furniture_store/widget/field/custom_bottombar.dart';
import 'package:get/get.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(child: Image.asset(AppImages.image4)),
            ),
            Text(
              'Add Product',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CommonTextField(
                label: 'Enter Product Title',
                hint: 'Product Title',
                controller: titleController,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CommonTextField(
                label: 'Enter Product Description',
                hint: 'Description',
                controller: descriptionController,
              ),
            ),
            SizedBox(height: 40),
            ComonButton(
              title: 'add product',
              onTap: () async {
                await addProduct();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter all details');
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      User? user = FirebaseAuth.instance.currentUser;
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('new collection').doc();

      await docRef.set({
        'docid': docRef.id,
        'title': titleController.text,
        'description': descriptionController.text,
        'userid': user!.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });

      setState(() {
        isLoading = false;
      });

      Get.snackbar('Success', 'Product Added Successfully');
      Get.off(() => CustomBottombar());
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Get.snackbar('Error', e.toString());
    }
  }
}
