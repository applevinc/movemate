import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/models/shipment.model.dart';

class SearchShipmentItemView extends StatelessWidget {
  const SearchShipmentItemView({
    super.key,
    required this.index,
    required this.shipment,
  });

  final Shipment shipment;
  final int index;

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
              MdiIcons.packageVariantClosed,
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
                  shipment.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.bold600(context),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${shipment.id} • ${shipment.from} - ${shipment.to}',
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
    ).animate(key: UniqueKey()).slideY(
          begin: 0.7.h,
          duration: Duration(milliseconds: 600 + (index * 50)),
          curve: Curves.easeIn,
        );
  }
}
