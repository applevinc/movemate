import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/assets/images.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';

class ShipmentCalculationDestinationView extends StatefulWidget {
  const ShipmentCalculationDestinationView({super.key});

  @override
  State<ShipmentCalculationDestinationView> createState() =>
      _ShipmentCalculationDestinationViewState();
}

class _ShipmentCalculationDestinationViewState
    extends State<ShipmentCalculationDestinationView> {
  late final TextEditingController senderLocationController;
  late final TextEditingController receiverLocationController;
  late final TextEditingController weightController;

  @override
  void initState() {
    super.initState();
    senderLocationController = TextEditingController();
    receiverLocationController = TextEditingController();
    weightController = TextEditingController();
  }

  @override
  void dispose() {
    senderLocationController.dispose();
    receiverLocationController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gap = 16.h;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Destination',
          style: AppText.bold600(context).copyWith(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: gap),
        Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: AppColors.boxshadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DestinationInputField(
                icon: AppImages.senderLocation,
                hintText: 'Sender location',
                controller: senderLocationController,
                duration: 600,
              ),
              SizedBox(height: gap),
              _DestinationInputField(
                icon: AppImages.receiverLocation,
                hintText: 'Receiver location',
                controller: receiverLocationController,
                duration: 700,
              ),
              SizedBox(height: gap),
              _DestinationInputField(
                icon: AppImages.weight,
                hintText: 'Approx weight',
                controller: receiverLocationController,
                duration: 800,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DestinationInputField extends StatelessWidget {
  const _DestinationInputField({
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.duration,
  });

  final String icon;
  final String hintText;
  final TextEditingController controller;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppText.bold500(context),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.sp),
        hintText: hintText,
        hintStyle: AppText.bold500(context).copyWith(
          color: const Color(0xff8f8e91),
        ),
        filled: true,
        fillColor: const Color(0xfff8f8f8),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                height: 24.h,
                width: 24.h,
              ),
              SizedBox(width: 8.w),
              Container(
                width: 1.w,
                height: 30.h,
                color: const Color(0xffe2e2e2),
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    )
        .animate(delay: const Duration(milliseconds: 250))
        .slideY(begin: 0.7.h, duration: Duration(milliseconds: duration));
  }
}
