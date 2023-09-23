import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';

class ShipmentHistoryView extends StatelessWidget {
  const ShipmentHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 50,
      padding: EdgeInsets.only(
        top: 10.h,
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
        bottom: 40.h,
      ),
      itemBuilder: (context, index) => ShipmentHistoryCard(index: index),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
    );
  }
}

class ShipmentHistoryCard extends StatelessWidget {
  const ShipmentHistoryCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: AppColors.boxshadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShipmentStatusView(),
                SizedBox(height: 8.h),
                Text(
                  'Arriving today!',
                  style: AppText.bold600(context).copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
                  style: AppText.bold500(context).copyWith(
                    fontSize: 13.sp,
                    color: AppColors.textGrey,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      '\$1400 USD',
                      style: AppText.bold600(context).copyWith(
                        fontSize: 13.sp,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      ' • Sep 20,2023',
                      style: AppText.bold500(context).copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 60.h,
            width: 50.w,
            color: Colors.black,
          ),
        ],
      ),
    ).animate(key: UniqueKey()).slideY(
          begin: 0.7.h,
          duration: Duration(milliseconds: 600 + (index * 100)),
          curve: Curves.easeIn,
        );
  }
}

class ShipmentStatusView extends StatelessWidget {
  const ShipmentStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.refresh,
              color: AppColors.green,
              size: 15.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'in-progress',
              style: AppText.bold500(context).copyWith(
                fontSize: 13.sp,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
