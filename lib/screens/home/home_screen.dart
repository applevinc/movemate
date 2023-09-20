import 'package:flutter/material.dart';
import 'package:movemate/core/styles/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Screen',
          style: AppText.bold500(context),
        ),
      ),
    );
  }
}
