import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(height: 20.h),
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
                icon: Icons.cloud_download_outlined,
                hintText: 'Sender location',
                controller: senderLocationController,
              ),
              SizedBox(height: gap),
              _DestinationInputField(
                icon: Icons.cloud_download_outlined,
                hintText: 'Receiver location',
                controller: receiverLocationController,
              ),
              SizedBox(height: gap),
              _DestinationInputField(
                icon: Icons.cloud_download_outlined,
                hintText: 'Approx weight',
                controller: receiverLocationController,
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
  });

  final IconData icon;
  final String hintText;
  final TextEditingController controller;

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
              Icon(icon),
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
    );
  }
}