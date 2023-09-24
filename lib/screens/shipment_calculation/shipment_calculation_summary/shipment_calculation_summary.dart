import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                ),
                const Spacer(),
                Image.asset(
                  AppAssets.box,
                  height: 170.h,
                ),
                SizedBox(height: 30.h),
                Text(
                  'Total Estimated Amount',
                  style: AppText.bold500(context).copyWith(
                    fontSize: 22.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    text: '\$1460',
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
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  width: 300.w,
                  child: Text(
                    'This amount is estimated this will vary if you change your location or weight',
                    textAlign: TextAlign.center,
                    style: AppText.bold500(context).copyWith(
                      color: const Color(0xff9b9b9b),
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
                AppButton(
                  label: 'Back to home',
                  onTap: () {
                    AppNavigator.pushAndRemoveUntil(context, const DashboardView());
                  },
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
