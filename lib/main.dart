import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movemate/app.dart';
import 'package:movemate/core/styles/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(const Duration(milliseconds: 1)).then((value) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light,
    ));
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MoveMateApp());
  });
}
