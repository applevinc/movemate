import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboardview.dart';

class ShipmentCalculationAppBarView extends StatelessWidget {
  const ShipmentCalculationAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(key: UniqueKey()).toggle(
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: value ? 170.h : 110.h,
          padding: EdgeInsets.only(top: 60.h, bottom: 20.h),
          color: AppColors.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: Colors.white,
                onPressed: () {
                  AppNavigator.pushAndRemoveUntil(context, const DashboardView());
                },
              ).animate().slideX(
                  begin: -0.5.w,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn),
              Text(
                'Calculate',
                style: AppText.bold500(context).copyWith(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .fade(duration: const Duration(milliseconds: 600), curve: Curves.easeIn)
                  .slideY(
                      begin: 0.5.h,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn),
              IgnorePointer(
                ignoring: true,
                child: BackButton(
                  color: Colors.transparent,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
