import 'package:flutter/material.dart';
import 'package:movemate/core/styles/text.dart';

class ShipmentHistoryScreen extends StatelessWidget {
  const ShipmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Shipment History Screen',
          style: AppText.bold500(context),
        ),
      ),
    );
  }
}
