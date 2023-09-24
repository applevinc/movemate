import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';

class HomeAvailableVehiclesView extends StatelessWidget {
  const HomeAvailableVehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 20.h),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                left: AppPadding.horizontal,
              ),
              child: Text(
                'Available vehicles',
                style: AppText.bold600(context).copyWith(
                  fontSize: 16.sp,
                ),
              ).animate(key: UniqueKey()).slideY(
                    begin: 0.6.h,
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                  ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
                itemBuilder: (context, index) => const HomeAvailableVehicleCard(),
                separatorBuilder: (context, index) => SizedBox(width: 20.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAvailableVehicleCard extends StatelessWidget {
  const HomeAvailableVehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: AppColors.boxshadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ocean Freight',
            style: AppText.bold400(context).copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'International',
            style: AppText.bold400(context).copyWith(
              fontSize: 13.sp,
              color: AppColors.textGrey,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 100.h,
              width: 80.w,
              color: Colors.black,
            ).animate(key: UniqueKey()).slideX(
                  begin: 0.6.h,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeIn,
                ),
          ),
        ],
      ),
    ).animate(key: UniqueKey()).slideX(
          begin: 0.6.h,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
  }
}
