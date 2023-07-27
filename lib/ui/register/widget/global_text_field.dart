import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class Globaltextfield extends StatelessWidget {
  const Globaltextfield(
      {Key? key,
      required this.fontSize,
      required this.controller,
      required this.obscureText,
      required this.hintext,
      required this.textInputType,
      required this.textAlign,
      required this.textInputAction})
      : super(key: key);
  final double fontSize;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final bool obscureText;
  final String hintext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      textAlign: textAlign,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintext,
        hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            color: AppColors.C_666666),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.C_666666,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.C_666666,
            width: 1,
          ),
        ),
      ),
    );
  }
}
