import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboard.view.dart';

class ShipmentCalculationAppBarView extends StatelessWidget {
  const ShipmentCalculationAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate().toggle(
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          height: value ? 100.h : 55.h,
          color: AppColors.primary,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                color: Colors.white,
                onPressed: () {
                  AppNavigator.pushAndRemoveUntil(context, const DashboardView());
                },
              ).animate().slideX(begin: -0.5.w, curve: Curves.easeIn),
              Text(
                'Calculate',
                style: AppText.bold500(context).copyWith(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .fade(curve: Curves.easeIn)
                  .slideY(begin: 0.2.h, curve: Curves.easeIn),
              BackButton(
                color: Colors.transparent,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
