import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    Key? key,
    required this.tabs,
    this.isScrollable = false,
    this.padding,
    this.controller,
    this.onTap,
  }) : super(key: key);

  final TabController? controller;
  final List<Widget> tabs;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;
  final void Function(int)? onTap;

  @override
  Size get preferredSize => Size.fromHeight(55.h);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable,
      controller: controller,
      onTap: onTap,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.orange,
      indicatorPadding: EdgeInsets.zero,
      indicatorWeight: 4.h,
      padding: EdgeInsets.zero,
      tabs: tabs,
    ).animate().slideX(
          begin: 0.2.h,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
  }
}
