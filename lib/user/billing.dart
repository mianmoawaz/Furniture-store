import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_store/widget/button/common_button.dart';

class Billing extends StatefulWidget {
  const Billing({super.key});

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back),
                  Spacer(),
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
                  'Billing Summary',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 20.h),
              buildRow('Subtotal', '\$3720.27'),
              buildRow('Discount', '-\$749.99'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Warranty (Platinum)',
                      style: TextStyle(fontSize: 16.sp)),
                  Row(
                    children: [
                      Text('\$259.99', style: TextStyle(fontSize: 16.sp)),
                      SizedBox(width: 5.w),
                      Text('Remove',
                          style:
                              TextStyle(color: Colors.blue, fontSize: 14.sp)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              buildRow('Shipping', '\$0.00'),
              buildRow('Tax', '\$228.72'),
              Divider(thickness: 1),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Grand Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp)),
                  Text('\$3,439.00',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp)),
                ],
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Order Comment',
                  hintText: 'Type here...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        Text('Please check to acknowledge our '),
                        GestureDetector(
                          onTap: () {},
                          child: Text('Privacy',
                              style: TextStyle(color: Colors.blue)),
                        ),
                        Text(' & '),
                        GestureDetector(
                          onTap: () {},
                          child: Text('Terms Policy',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80.h),
              Center(
                child: ComonButton(
                  title: 'Pay \$3,439.00',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(16),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 48,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Congratulations!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Your order has been placed.\nPlease check the delivery status at\nOrder Tracking page.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(String title, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16.sp)),
          Text(amount, style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
