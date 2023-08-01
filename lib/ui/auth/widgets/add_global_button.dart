import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';

class AddGlobalButton extends StatelessWidget {
  const AddGlobalButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: AppColors.black,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
              fontSize: 18.sp,
              fontFamily: "LeagueSpartan",
            ),
          ),
        ),
      ),
    );
  }
}