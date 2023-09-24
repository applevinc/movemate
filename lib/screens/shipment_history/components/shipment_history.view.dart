import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/assets/images.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/enums/shipment_status.enum.dart';

class ShipmentHistoryView extends StatelessWidget {
  const ShipmentHistoryView({super.key, required this.shipmentStatus});

  final ShipmentStatus shipmentStatus;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: 10.h,
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
        bottom: 40.h,
      ),
      itemBuilder: (context, index) => ShipmentHistoryCard(
        index: index,
        shipmentStatus: shipmentStatus,
      ),
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
    );
  }
}

class ShipmentHistoryCard extends StatelessWidget {
  const ShipmentHistoryCard({
    super.key,
    required this.index,
    required this.shipmentStatus,
  });

  final int index;
  final ShipmentStatus shipmentStatus;

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
                ShipmentStatusView(shipmentStatus),
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
          Image.asset(
            AppImages.box,
            height: 80.h,
            width: 80.w,
          ),
        ],
      ),
    ).animate().slideY(
          begin: 0.7.h,
          duration: Duration(milliseconds: 600 + (index * 100)),
          curve: Curves.easeIn,
        );
  }
}

class ShipmentStatusView extends StatelessWidget {
  const ShipmentStatusView(this.shipmentStatus, {super.key});

  final ShipmentStatus shipmentStatus;

  @override
  Widget build(BuildContext context) {
    switch (shipmentStatus) {
      case ShipmentStatus.inProgress:
        return view(
          context: context,
          icon: Icons.refresh,
          color: const Color(0xff5ec699),
          message: 'In progress',
        );
      case ShipmentStatus.completed:
        return view(
          context: context,
          icon: Icons.check_circle_outline,
          color: const Color(0xffbd7d09),
          message: 'Completed',
        );
      case ShipmentStatus.cancelled:
        return view(
          context: context,
          icon: Icons.refresh,
          color: const Color(0xffd2556d),
          message: 'Cancelled',
        );
      case ShipmentStatus.pending:
        return view(
          context: context,
          icon: Icons.published_with_changes_outlined,
          color: Colors.blue,
          message: 'Loading',
        );
      default:
    }

    return const SizedBox.shrink();
  }

  UnconstrainedBox view({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String message,
  }) {
    return UnconstrainedBox(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 15.sp,
              weight: 2.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              message,
              style: AppText.bold600(context).copyWith(
                fontSize: 13.sp,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
