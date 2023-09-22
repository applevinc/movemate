import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/dashboardview.dart';
import 'package:movemate/screens/shipment_calculation/components/shipment_calculation_categories_view.dart';
import 'package:movemate/screens/shipment_calculation/components/shipment_calculation_destination_view.dart';
import 'package:movemate/screens/shipment_calculation/components/shipment_calculation_packaging_view.dart';
import 'package:movemate/screens/widgets/app_button.dart';
import 'package:movemate/screens/widgets/close_keyboard_wrapper.dart';

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
          appBar: AppBar(
            elevation: 0,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                AppNavigator.pushAndRemoveUntil(context, const DashboardView());
              },
            ),
            title: Text(
              'Calculate',
              style: AppText.bold500(context).copyWith(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 20.h,
              left: AppPadding.horizontal,
              right: AppPadding.horizontal,
              bottom: 40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShipmentCalculationDestinationView(),
                ShipmentCalculationPackingView(),
                ShipmentCalculationCategoriesView(),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: AppPadding.horizontal,
              right: AppPadding.horizontal,
              bottom: 40.h,
            ),
            child: AppButton(
              label: 'Calculate',
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
