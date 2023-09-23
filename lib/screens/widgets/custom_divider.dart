import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      margin: padding ?? EdgeInsets.symmetric(vertical: 20.h),
      color: AppColors.grey,
    );
  }
}
