import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/screens/widgets/custom_divider.dart';
import 'package:movemate/screens/widgets/search_textfield.dart';

class SearchShipmentScreen extends StatelessWidget {
  const SearchShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.primary,
            padding: EdgeInsets.only(
              top: 60.h,
              right: AppPadding.horizontal,
              left: AppPadding.horizontal,
              bottom: 20.h,
            ),
            child: Row(
              children: const [
                BackButton(color: Colors.white),
                Expanded(
                  child: Hero(
                    tag: 'search',
                    child: SearchTextField(
                      autoFocus: true,
                      readOnly: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: AppPadding.horizontal,
            ),
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: AppColors.boxshadow,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: const [
                SearchShipmentResultView(),
                CustomDivider(),
                SearchShipmentResultView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchShipmentResultView extends StatelessWidget {
  const SearchShipmentResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.symetricHorizontalOnly,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.sp),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shop_outlined,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Summer linen jacket',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.bold600(context),
                ),
                SizedBox(height: 4.h),
                Text(
                  '#NEJ20089934122231 • Barcelona - Paris',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.bold600(context).copyWith(
                    color: AppColors.textGrey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
