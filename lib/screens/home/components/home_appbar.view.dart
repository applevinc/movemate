import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/core/styles/text.dart';
import 'package:movemate/core/utils/navigator.dart';
import 'package:movemate/screens/home/search_shipment/search_shipment_screen.dart';
import 'package:movemate/widgets/custom_cached_network_image.dart';
import 'package:movemate/widgets/search_textfield.dart';

const profileImageUrl =
    'https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80';

class HomeAppBarView extends StatelessWidget {
  const HomeAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      expandedHeight: 170.h,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        background: Container(
          color: AppColors.primary,
          padding: EdgeInsets.only(
            top: 70.h,
            left: AppPadding.horizontal,
            right: AppPadding.horizontal,
            bottom: 20.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomCacheNetworkImage(
                    image: profileImageUrl,
                    height: 50.h,
                    width: 50.h,
                    shape: BoxShape.circle,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.near_me,
                            color: const Color(0xffd3cbd9),
                            size: 20.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Your location',
                            style: AppText.bold500(context).copyWith(
                              color: const Color(0xffd3cbd9),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Text(
                            'Wertheimer, linois',
                            style: AppText.bold500(context).copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Hero(
                tag: 'search',
                child: SearchTextField(
                  onTap: () {
                    AppNavigator.to(context, const SearchShipmentScreen());
                  },
                ),
              ),
            ],
          ),
        ).animate().slideY(
              begin: -0.5.h,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn,
            ),
      ),
    );
  }
}
