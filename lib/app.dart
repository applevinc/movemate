import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/theme.dart';
import 'package:movemate/screens/dashboardview.dart';

class MoveMateApp extends StatelessWidget {
  const MoveMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movemate',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: const DashboardView(),
        );
      },
    );
  }
}
