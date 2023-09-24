import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/assets/images.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/models/shipment_vehicle.model.dart';

class HomeAvailableVehiclesView extends StatefulWidget {
  const HomeAvailableVehiclesView({super.key});

  @override
  State<HomeAvailableVehiclesView> createState() => _HomeAvailableVehiclesViewState();
}

class _HomeAvailableVehiclesViewState extends State<HomeAvailableVehiclesView> {
  final vehicles = [
    ShipmentVehicle(
      name: 'Ocean Freight',
      reach: 'International',
      image: AppImages.cargoShip,
    ),
    ShipmentVehicle(
      name: 'Cargo Freight',
      reach: 'Reliable',
      image: AppImages.cargoTruck,
    ),
    ShipmentVehicle(
      name: 'Train Freight',
      reach: 'Multi Service',
      image: AppImages.train,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 20.h),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                left: AppPadding.horizontal,
              ),
              child: Text(
                'Available vehicles',
                style: AppText.bold600(context).copyWith(
                  fontSize: 16.sp,
                ),
              ).animate().slideY(
                    begin: 0.6.h,
                    delay: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                  ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 200.h,
              child: ListView.separated(
                itemCount: vehicles.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
                itemBuilder: (context, index) {
                  final shipmentVehicle = vehicles[index];
                  return HomeAvailableVehicleCard(shipmentVehicle: shipmentVehicle);
                },
                separatorBuilder: (context, index) => SizedBox(width: 20.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAvailableVehicleCard extends StatelessWidget {
  const HomeAvailableVehicleCard({
    super.key,
    required this.shipmentVehicle,
  });

  final ShipmentVehicle shipmentVehicle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: AppColors.boxshadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shipmentVehicle.name,
                  style: AppText.bold600(context).copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  shipmentVehicle.reach,
                  style: AppText.bold400(context).copyWith(
                    fontSize: 13.sp,
                    color: AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              shipmentVehicle.image,
              fit: BoxFit.cover,
            ).animate().slideX(
                  begin: 0.6.h,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeIn,
                ),
          ),
        ],
      ),
    ).animate().slideX(
          begin: 0.6.h,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
  }
}
