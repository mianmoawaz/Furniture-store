import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final List<Map<String, String>> items = [
    {
      'name': 'Wood Frame',
      'price': '\$1600',
      'image': 'assets/🖼 Imput Image (1).png'
    },
    {
      'name': 'Yellow Armchair',
      'price': '\$550',
      'image': 'assets/🖼 Imput Image (2).png'
    },
    {
      'name': 'Modern Armchair',
      'price': '\$250',
      'image': 'assets/🖼 Imput Image (4).png'
    },
    {
      'name': 'IKEA Ingolf',
      'price': '\$150',
      'image': 'assets/🖼 Imput Image (5).png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Product',
                hintText: 'modern chair...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                print('Text Field Value: $value');
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Found result',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return Container(
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
                        Image.asset(
                          items[index]['image']!,
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          items[index]['name']!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          items[index]['price']!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
