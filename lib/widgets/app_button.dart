import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/widgets/animated_button.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.labelColor,
    this.backgroundColor,
    this.disabled = false,
    this.isBusy = false,
    this.child,
    this.elevation = 0,
    this.icon,
    this.border,
    this.padding,
    this.width,
    this.borderRadius,
    this.labelStyle,
    this.labelFontSize,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final Color? labelColor;
  final Color? backgroundColor;
  final bool disabled;
  final bool isBusy;
  final Widget? child;
  final double elevation;
  final String? icon;
  final BorderSide? border;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? labelStyle;
  final double? labelFontSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedButton(
      onTap: disabled
          ? () {}
          : isBusy
              ? () {}
              : onTap,
      child: Container(
        width: width ?? size.width,
        padding: padding ?? EdgeInsets.symmetric(vertical: 17.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.orange,
          borderRadius: borderRadius ?? BorderRadius.circular(30.r),
        ),
        child: isBusy
            ? SizedBox(
                height: 23.h,
                width: 23.h,
                child: const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                label,
                textAlign: TextAlign.center,
                style: labelStyle ??
                    AppText.bold600(context).copyWith(
                      color: labelColor ?? Colors.white,
                      fontSize: labelFontSize ?? 16.sp,
                    ),
              ),
      ),
    );
  }
}
