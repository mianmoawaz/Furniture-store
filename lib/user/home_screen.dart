import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/constants/app_colors.dart';
import 'package:furniture_store/user/add_product.dart';
import 'package:furniture_store/user/detail_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, size: 28),
                  Icon(Icons.qr_code_2_outlined, size: 28),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Browse by categories',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('new collection')
                    .where('userid',
                        isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No products available'));
                  }

                  var products = snapshot.data!.docs;

                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      var product = products[index];

                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailScreen(), arguments: {
                            'title': product['title'],
                            'description': product['description'],
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final String docid = snapshot
                                      .data!.docs[index]['docid']
                                      .toString();
                                  await FirebaseFirestore.instance
                                      .collection('new collection')
                                      .doc(docid)
                                      .delete();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 100, right: 100),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Icon(Icons.delete),
                                  ),
                                ),
                              ),

                              // Image.asset(
                              //   "assets/Image.png", // Placeholder image
                              //   height: 90.h,
                              //   width: 90.w,
                              //   fit: BoxFit.contain,
                              // ),
                              SizedBox(height: 10.h),
                              Text(
                                product['title'],
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                product['description'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.green,
        child: Center(
          child: Icon(Icons.add, color: AppColors.white),
        ),
        onPressed: () {
          Get.to(AddProduct());
        },
      ),
    );
  }
}
