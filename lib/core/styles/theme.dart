import 'package:movemate/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          0xff493491,
          <int, Color>{
            50: AppColors.primary.withOpacity(.1), //10%
            100: AppColors.primary.withOpacity(.2), //20%
            200: AppColors.primary.withOpacity(.3), //30%
            300: AppColors.primary.withOpacity(.4), //40%
            400: AppColors.primary.withOpacity(.5), //50%
            500: AppColors.primary.withOpacity(.6), //60%
            600: AppColors.primary.withOpacity(.7), //70%
            700: AppColors.primary.withOpacity(.8), //80%
            800: AppColors.primary.withOpacity(.9), //90%
            900: AppColors.primary, //100%
          },
        ),
      ).copyWith(secondary: AppColors.orange),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        displayColor: AppColors.textBlack,
        bodyColor: AppColors.textBlack,
      ),
    );
  }
}
