import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboardview.dart';
import 'package:movemate/widgets/animated_button.dart';
import 'package:movemate/widgets/custom_tabbar.dart';

final effects = <Effect>[
  FadeEffect(duration: 100.ms, curve: Curves.easeOut),
];

class ShipmentHistoryAppBar extends StatefulWidget {
  const ShipmentHistoryAppBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<ShipmentHistoryAppBar> createState() => _ShipmentHistoryAppBarState();
}

class _ShipmentHistoryAppBarState extends State<ShipmentHistoryAppBar> {
  final tabs = [
    'All',
    'Completed',
    'In progress',
    'Pending order',
    'Cancelled',
  ];
  String selectedTab = 'All';

  void selectTab(int index) {
    selectedTab = tabs[index];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: BackButton(
        color: Colors.white,
        onPressed: () {
          AppNavigator.pushAndRemoveUntil(context, const DashboardView());
        },
      ).animate().slideX(
            begin: -0.5.w,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
          ),
      pinned: true,
      title: Text(
        'Shipment history',
        style: AppText.bold600(context).copyWith(
          fontSize: 16.sp,
          color: Colors.white,
        ),
      )
          .animate()
          .fade(duration: const Duration(milliseconds: 600), curve: Curves.easeIn)
          .slideY(
              begin: 0.5.h,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn),
      bottom: CustomTabBar(
        isScrollable: true,
        controller: widget.tabController,
        tabs: List.generate(
          tabs.length,
          (index) {
            final tab = tabs[index];
            final selected = tab == selectedTab;

            return _Tab(
              index: index,
              name: tab,
              selected: selected,
              controller: widget.tabController,
              onTap: () => selectTab(index),
            );
          },
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.name,
    required this.selected,
    required this.controller,
    required this.index,
    required this.onTap,
  });

  final int index;
  final String name;
  final bool selected;
  final TabController controller;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    //final count = (Random().nextInt(5) + 1).toString();
    const count = '5';

    return AnimatedButton(
      onTap: () {
        controller.animateTo(index);
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          children: [
            Text(
              name,
              style: AppText.bold600(context).copyWith(
                color: selected ? Colors.white : const Color(0xffc2b4ee),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: selected ? AppColors.orange : const Color(0xff7257c4),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                count,
                style: AppText.bold600(context).copyWith(
                  fontSize: 12.sp,
                  color: selected ? Colors.white : const Color(0xffc4b2fb),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
