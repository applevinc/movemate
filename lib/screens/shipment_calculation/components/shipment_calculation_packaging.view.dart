import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/assets/images.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';

class ShipmentCalculationPackingView extends StatelessWidget {
  const ShipmentCalculationPackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Packaging',
            style: AppText.bold600(context).copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'What are you sending?',
            style: AppText.bold500(context).copyWith(
              fontSize: 16.sp,
              color: AppColors.textGrey,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.only(
              top: 5.h,
              bottom: 5.h,
              right: 15.w,
              left: 5.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: AppColors.boxshadow,
            ),
            child: Row(
              children: [
                Image.asset(
                  AppImages.box,
                  height: 50.h,
                  width: 50.h,
                ),
                Container(
                  width: 1.w,
                  height: 30.h,
                  color: const Color(0xffe2e2e2),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Box',
                  style: AppText.bold600(context).copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xff8b8b8b),
                  size: 24.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
