import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.lableText,
      required this.keyBoardType,
      this.isObsecure = false,
      required this.maxLength});

  final TextEditingController controller;
  final String lableText;
  final String hintText;
  final TextInputType keyBoardType;
  final bool isObsecure;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: gColor),
      obscureText: isObsecure,
      keyboardType: keyBoardType,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      decoration: InputDecoration(
          labelText: lableText,
          hintText: hintText,
          enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: gColor.withOpacity(0.3),width: 1)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: gColor.withOpacity(0.3),width: 1)),
          hintStyle: TextStyle(
            color: gColor,
            fontSize: 12,
          ),
          labelStyle: TextStyle(
            color: gColor,
            fontSize: 14,
          )),
    );
  }
}
