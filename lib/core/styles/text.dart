import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  AppText._();

  static TextStyle light14(BuildContext context) {
    return bold300(context).copyWith(
      fontSize: 14.sp,
    );
  }

  static TextStyle medium14(BuildContext context) {
    return bold500(context).copyWith(
      fontSize: 14.sp,
    );
  }

  static TextStyle medium18(BuildContext context) {
    return bold500(context).copyWith(
      fontSize: 18.sp,
    );
  }

  static TextStyle regular12(BuildContext context) {
    return bold400(context).copyWith(
      fontSize: 12.sp,
    );
  }

  static TextStyle regular14(BuildContext context) {
    return bold400(context).copyWith(
      fontSize: 14.sp,
    );
  }

  static TextStyle regular16(BuildContext context) {
    return bold400(context).copyWith(
      fontSize: 16.sp,
    );
  }

  static TextStyle bold18(BuildContext context) {
    return bold700(context).copyWith(
      fontSize: 18.sp,
    );
  }

  static TextStyle bold32(BuildContext context) {
    return bold700(context).copyWith(
      fontSize: 32.sp,
    );
  }

  static TextStyle bold400(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle bold300(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w300,
        );
  }

  static TextStyle bold500(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle bold600(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle bold700(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle bold900(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w900,
        );
  }
}
