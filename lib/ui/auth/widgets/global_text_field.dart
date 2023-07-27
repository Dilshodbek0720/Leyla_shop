import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({super.key, required this.hintext, required this.controller});
  final String hintext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: TextStyle(
            fontSize: 17,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            color: AppColors.C_666666
        ),
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.C_F5F7F9,
          hintText: hintext,
          hintStyle: TextStyle(
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
              color: AppColors.C_666666
          ),
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
      ),
    );
  }
}
