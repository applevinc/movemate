import 'package:flutter/material.dart';
import 'package:movemate/core/styles/text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: AppText.bold500(context),
        ),
      ),
    );
  }
}
