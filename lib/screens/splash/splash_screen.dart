import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/assets/images.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboard.view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      AppNavigator.to(context, const DashboardView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logo,
          height: 40.h,
        )
            .animate()
            .fade(duration: const Duration(milliseconds: 500))
            .slideY(begin: 0.7.h),
      ),
    );
  }
}
