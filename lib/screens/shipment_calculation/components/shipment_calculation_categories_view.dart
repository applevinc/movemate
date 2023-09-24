import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  void selectCategory(int index) {
    final category = categories[index];

    if (category == selectedCategory) {
      selectedCategory = '';
      setState(() {});
    } else {
      selectedCategory = categories[index];
      setState(() {});
    }
  }

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
            spacing: 12.w,
            runSpacing: 10.h,
            children: List.generate(
              categories.length,
              (index) {
                final category = categories[index];
                final selected = category == selectedCategory;
                return _CategoryButton(
                  name: category,
                  selected: selected,
                  onTap: () => selectCategory(index),
                );
              },
            ).animate(interval: 100.ms).fade(duration: 300.ms).slideX(begin: 0.5.h),
          ),
        ],
      ),
    );
  }
}

class _CategoryButton extends StatefulWidget {
  const _CategoryButton({
    required this.name,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final bool selected;
  final Function() onTap;

  @override
  State<_CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<_CategoryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;
    return GestureDetector(
      onTap: () async {
        _controller.forward();
        await Future.delayed(const Duration(milliseconds: 200), () {
          _controller.reverse();
        });

        widget.onTap();
      },
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.7).animate(_controller),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff9e9e9e)),
            borderRadius: BorderRadius.circular(8.r),
            color: selected ? const Color(0xff142333) : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selected)
                Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                ),
              Text(
                widget.name,
                style: AppText.bold500(context).copyWith(
                  color: selected ? Colors.white : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
