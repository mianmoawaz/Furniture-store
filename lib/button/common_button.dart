import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComonButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool? isLoding;
  const ComonButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isLoding = false});

  @override
  State<ComonButton> createState() => _ComonButtonState();
}

class _ComonButtonState extends State<ComonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
        height: 44.h,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
