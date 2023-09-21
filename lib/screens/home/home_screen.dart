import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/screens/home/components/home_appbar_view.dart';
import 'package:movemate/screens/home/components/home_available_vehicles_view.dart';
import 'package:movemate/screens/home/components/home_tracking_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarView(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeTrackingView(),
            HomeAvailableVehiclesView(),
          ],
        ),
      ),
    );
  }
}
