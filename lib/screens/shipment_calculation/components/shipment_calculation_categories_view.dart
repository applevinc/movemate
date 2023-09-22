import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/text.dart';

class ShipmentCalculationCategoriesView extends StatefulWidget {
  const ShipmentCalculationCategoriesView({super.key});

  @override
  State<ShipmentCalculationCategoriesView> createState() =>
      _ShipmentCalculationCategoriesViewState();
}

class _ShipmentCalculationCategoriesViewState
    extends State<ShipmentCalculationCategoriesView> {
  final categories = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others',
  ];
  String selectedCategory = '';

  void selectCategory(String category) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: AppText.bold600(context).copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'What are you sending?',
            style: AppText.bold500(context).copyWith(
              fontSize: 16.sp,
              color: AppColors.textGrey,
            ),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 16.w,
            runSpacing: 10.h,
            children: List.generate(
              categories.length,
              (index) {
                final category = categories[index];
                final selected = category == selectedCategory;
                return _CategoryButton(
                  name: category,
                  selected: selected,
                  onTap: () => selectCategory(category),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.name,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff9e9e9e)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          name,
          style: AppText.bold500(context),
        ),
      ),
    );
  }
}
