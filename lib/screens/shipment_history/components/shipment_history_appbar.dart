import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboardview.dart';
import 'package:movemate/screens/widgets/custom_tabbar.dart';

class ShipmentHistoryAppBar extends StatelessWidget {
  const ShipmentHistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: BackButton(
        color: Colors.white,
        onPressed: () {
          AppNavigator.pushAndRemoveUntil(context, const DashboardView());
        },
      ),
      pinned: true,
      title: Text(
        'Shipment history',
        style: AppText.bold600(context).copyWith(
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
      bottom: CustomTabBar(
        isScrollable: true,
        tabs: List.generate(
          5,
          (index) => Tab(text: 'index $index'),
        ),
      ),
    );
  }
}
