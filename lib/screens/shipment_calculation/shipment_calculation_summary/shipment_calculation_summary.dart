import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/assets/app_assets.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboardview.dart';
import 'package:movemate/widgets/app_button.dart';

class ShipmentCalculationSummaryScreen extends StatelessWidget {
  const ShipmentCalculationSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: AppPadding.symetricHorizontalOnly,
            child: Column(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppAssets.logo,
                    height: 40.h,
                  ),
                )
                    .animate(key: UniqueKey())
                    .fade(duration: const Duration(milliseconds: 500))
                    .slideY(begin: 0.7.h),
                const Spacer(),
                Image.asset(
                  AppAssets.box,
                  height: 170.h,
                )
                    .animate(key: UniqueKey())
                    .fade(duration: const Duration(milliseconds: 600))
                    .scaleXY(begin: 0.3.h, end: 1)
                    .slideY(begin: 0.7.h),
                SizedBox(height: 30.h),
                Text(
                  'Total Estimated Amount',
                  style: AppText.bold500(context).copyWith(
                    fontSize: 22.sp,
                    color: Colors.black,
                  ),
                )
                    .animate(key: UniqueKey())
                    .fade(duration: const Duration(milliseconds: 700))
                    .slideY(begin: 0.7.h),
                SizedBox(height: 4.h),
                Animate()
                    .custom(
                      duration: const Duration(seconds: 2),
                      begin: 1000,
                      end: 1460,
                      builder: (_, value, __) {
                        final amount = value.round().toString();

                        return RichText(
                          text: TextSpan(
                            text: '\$$amount',
                            style: AppText.bold500(context).copyWith(
                              fontSize: 22.sp,
                              color: AppColors.green,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' USD',
                                style: AppText.bold500(context).copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                    .animate(key: UniqueKey())
                    .fade(duration: const Duration(milliseconds: 800))
                    .slideY(begin: 0.7.h),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 300.w,
                  child: Text(
                    'This amount is estimated this will vary if you change your location or weight',
                    textAlign: TextAlign.center,
                    style: AppText.bold500(context).copyWith(
                      color: const Color(0xff9b9b9b),
                    ),
                  )
                      .animate(key: UniqueKey())
                      .fade(duration: const Duration(milliseconds: 900))
                      .slideY(begin: 0.7.h),
                ),
                SizedBox(height: 36.h),
                AppButton(
                  label: 'Back to home',
                  onTap: () {
                    AppNavigator.pushAndRemoveUntil(context, const DashboardView());
                  },
                )
                    .animate(key: UniqueKey())
                    .fade(duration: const Duration(seconds: 2))
                    .slideY(begin: 0.7.h),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
