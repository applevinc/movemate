import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xff493491);
  static const white = Colors.white;
  static const textBlack = Color(0xff0a1623);
  static const textGrey = Color(0xff828084);
  static const orange = Color(0xfff27a22);
  static const grey = Color(0xfff4f4f5);
  static const green = Color(0xff2ac478);

 static final boxshadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.06),
      offset: const Offset(0, 3),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];
}
