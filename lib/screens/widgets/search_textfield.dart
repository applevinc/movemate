import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Enter the receipt number ...',
        hintStyle: AppText.bold500(context).copyWith(
          color: AppColors.textGrey,
        ),
        contentPadding: EdgeInsets.all(8.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Icon(
            Icons.search,
            color: AppColors.primary,
            size: 22.sp,
          ),
        ),
        suffixIcon: Container(
          margin: EdgeInsets.all(8.sp),
          padding: EdgeInsets.all(10.sp),
          decoration: const BoxDecoration(
            color: AppColors.orange,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.shop_outlined,
            color: Colors.white,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
