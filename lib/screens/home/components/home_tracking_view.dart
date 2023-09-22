import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/screens/widgets/custom_divider.dart';

class HomeTrackingView extends StatelessWidget {
  const HomeTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tracking',
              style: AppText.bold600(context).copyWith(
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 20.h),
            const ShipmentStopCard(),
            SizedBox(height: 1.h),
            const AddStopButton(),
          ],
        ),
      ),
    );
  }
}

class ShipmentStopCard extends StatelessWidget {
  const ShipmentStopCard({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppText.bold500(context).copyWith(
      fontSize: 13.sp,
      color: AppColors.textGrey,
    );

    final subtitleStyle = AppText.bold600(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: AppColors.boxshadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipment Number',
                    style: AppText.bold500(context).copyWith(
                      fontSize: 13.sp,
                      color: AppColors.textGrey,
                    ),
                  ),
                  Text(
                    'NEJ20089934122231',
                    style: AppText.bold600(context).copyWith(),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 40.h,
                width: 30.w,
                color: Colors.black,
              ),
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              imageIcon(),
              SizedBox(width: 12.w),
              SizedBox(
                width: 110.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sender',
                      style: titleStyle,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Atlanta, 5243',
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time',
                      style: titleStyle,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        greenDot(),
                        SizedBox(width: 5.w),
                        Text(
                          '2 day -3 days',
                          style: subtitleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Row(
            children: [
              imageIcon(),
              SizedBox(width: 12.w),
              SizedBox(
                width: 110.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Receiver',
                      style: titleStyle,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Chicago, 6342',
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: titleStyle,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Waiting to collect',
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container imageIcon() {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: const BoxDecoration(
        color: Color(0xffffe5d5),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.shop_2,
        color: Colors.black,
        size: 24.sp,
      ),
    );
  }

  Widget greenDot() {
    return Container(
      height: 8.h,
      width: 8.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff47ca2d),
      ),
    );
  }
}

class AddStopButton extends StatelessWidget {
  const AddStopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: AppColors.boxshadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: AppColors.orange,
            size: 24.sp,
          ),
          SizedBox(width: 4.w),
          Text(
            'Add Stop',
            style: AppText.bold600(context).copyWith(
              color: AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
