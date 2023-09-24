import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboardview.dart';
import 'package:movemate/screens/shipment_calculation/components/shipment_calculation_appbar.dart';
import 'package:movemate/screens/shipment_calculation/components/shipment_calculation_categories.view.dart';
import 'package:movemate/screens/shipment_calculation/components/shipment_calculation_destination.view.dart';
import 'package:movemate/screens/shipment_calculation/components/shipment_calculation_packaging.view.dart';
import 'package:movemate/screens/shipment_calculation/shipment_calculation_summary/shipment_calculation_summary.dart';
import 'package:movemate/widgets/app_button.dart';
import 'package:movemate/widgets/close_keyboard_wrapper.dart';

class ShipmentCalculationScreen extends StatelessWidget {
  const ShipmentCalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        AppNavigator.pushAndRemoveUntil(context, const DashboardView());
        return Future.value(true);
      },
      child: CloseKeyboardWrapper(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShipmentCalculationAppBarView(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: AppPadding.horizontal,
                    right: AppPadding.horizontal,
                    bottom: 40.h,
                  ),
                  child: Column(
                    children: [
                      const ShipmentCalculationDestinationView(),
                      const ShipmentCalculationPackingView(),
                      const ShipmentCalculationCategoriesView(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 40.h,
                          horizontal: AppPadding.horizontal,
                        ),
                        child: AppButton(
                          label: 'Calculate',
                          onTap: () {
                            AppNavigator.to(
                                context, const ShipmentCalculationSummaryScreen());
                          },
                        ),
                      ).animate(delay: const Duration(milliseconds: 500)).slideY(
                          begin: 0.7.h, duration: const Duration(milliseconds: 600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
