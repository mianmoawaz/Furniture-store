import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixicon;
  final TextEditingController controller;
  final bool isPassword;

  const CommonTextField({
    Key? key,
    required this.hintText,
    required this.prefixicon,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(widget.prefixicon, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? _obscureText : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
          if (widget.isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}
