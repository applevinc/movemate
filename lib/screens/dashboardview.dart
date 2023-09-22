import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/screens/home/home_screen.dart';
import 'package:movemate/screens/profile/profile_screen.dart';
import 'package:movemate/screens/shipment_calculation/shipment_calculation_screen.dart';
import 'package:movemate/screens/shipment_history/shipment_history_screen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  static const pages = <Widget>[
    HomeScreen(),
    ShipmentCalculationScreen(),
    ShipmentHistoryScreen(),
    ProfileScreen(),
  ];
  bool hideBottomNavigationBar = false;

  void _onPageTapped(int index) {
    if (index == 1) {
      hideBottomNavigationBar = true;
    }

    if (index == 2) {
      hideBottomNavigationBar = true;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppText.bold500(context).copyWith(
      fontSize: 12.sp,
    );

    return Scaffold(
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: hideBottomNavigationBar
          ? const SizedBox.shrink()
          : BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calculate_outlined),
                  label: 'Calculate',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history_outlined),
                  label: 'Shipment',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.textGrey,
              type: BottomNavigationBarType.fixed,
              iconSize: 24.sp,
              selectedLabelStyle: labelStyle.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: labelStyle.copyWith(
                color: AppColors.textGrey,
              ),
              onTap: _onPageTapped,
            ),
    );
  }
}
