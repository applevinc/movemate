import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboardview.dart';
import 'package:movemate/screens/shipment_history/components/shipment_history_appbar.dart';
import 'package:movemate/screens/shipment_history/components/shipment_history_view.dart';

class ShipmentHistoryScreen extends StatefulWidget {
  const ShipmentHistoryScreen({super.key});

  @override
  State<ShipmentHistoryScreen> createState() => _ShipmentHistoryScreenState();
}

class _ShipmentHistoryScreenState extends State<ShipmentHistoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        AppNavigator.pushAndRemoveUntil(context, const DashboardView());
        return Future.value(true);
      },
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                 ShipmentHistoryAppBar(tabController: tabController),
                SliverPadding(
                  padding: EdgeInsets.only(
                    top: AppPadding.vertical,
                    left: AppPadding.horizontal,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Shipments',
                      style: AppText.bold600(context).copyWith(
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: tabController,
              children: List.generate(5, (index) => const ShipmentHistoryView()),
            ),
          ),
        ),
      ),
    );
  }
}
