import 'package:flutter/material.dart';
import 'package:movemate/screens/home/components/home_appbar.view.dart';
import 'package:movemate/screens/home/components/home_available_vehicles.view.dart';
import 'package:movemate/screens/home/components/home_shipment_tracking.view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: const Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            HomeAppBarView(),
            HomeShipmentTrackingView(),
            HomeAvailableVehiclesView(),
          ],
        ),
      ),
    );
  }
}
