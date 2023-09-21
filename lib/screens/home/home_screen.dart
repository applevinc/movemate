import 'package:flutter/material.dart';
import 'package:movemate/screens/home/components/home_appbar_view.dart';
import 'package:movemate/screens/home/components/home_available_vehicles_view.dart';
import 'package:movemate/screens/home/components/home_tracking_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeAppBarView(),
          HomeTrackingView(),
          HomeAvailableVehiclesView(),
        ],
      ),
    );
  }
}
