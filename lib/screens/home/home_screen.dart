import 'package:flutter/material.dart';
import 'package:movemate/screens/home/components/home_appbar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          HomeAppBarView(),
        ],
      ),
    );
  }
}
