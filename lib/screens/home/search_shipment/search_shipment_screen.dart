import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/styles/colors.dart';
import 'package:movemate/core/styles/spacing.dart';
import 'package:movemate/models/shipment.model.dart';
import 'package:movemate/screens/home/search_shipment/components/search_shipment_item.view.dart';
import 'package:movemate/widgets/close_keyboard_wrapper.dart';
import 'package:movemate/widgets/custom_divider.dart';
import 'package:movemate/widgets/search_textfield.dart';

class SearchShipmentScreen extends StatefulWidget {
  const SearchShipmentScreen({super.key});

  @override
  State<SearchShipmentScreen> createState() => _SearchShipmentScreenState();
}

class _SearchShipmentScreenState extends State<SearchShipmentScreen> {
  List<Shipment> filterableShipments = shipments;
  Timer? _debounce;

  void search(String query) {
    if (shipments.isEmpty) {
      return;
    }

    if (query.isEmpty) {
      filterableShipments = shipments;
      setState(() {});
      return;
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        final filteredShipments = shipments.where((shipment) {
          final queryLower = query.toLowerCase();
          final shipmentNameLower = shipment.name.toLowerCase();

          return shipmentNameLower.contains(queryLower);
        }).toList();

        filterableShipments = filteredShipments;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: CloseKeyboardWrapper(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: AppColors.primary,
                padding: EdgeInsets.only(
                  top: 60.h,
                  right: AppPadding.horizontal,
                  //left: AppPadding.horizontal,
                  bottom: 20.h,
                ),
                child: Row(
                  children: [
                    const BackButton(color: Colors.white),
                    Expanded(
                      child: Hero(
                        tag: 'search',
                        child: SearchTextField(
                          autoFocus: false,
                          readOnly: false,
                          onChanged: (query) => search(query),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (filterableShipments.isNotEmpty)
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: AppPadding.horizontal,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: AppColors.boxshadow,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: filterableShipments.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final shipment = filterableShipments[index];
                      return SearchShipmentItemView(shipment: shipment, index: index);
                    },
                    separatorBuilder: (context, index) => CustomDivider(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ).animate(key: UniqueKey()).slideY(
                          begin: 0.7.h,
                          duration: Duration(milliseconds: 600 + (index * 50)),
                          curve: Curves.easeIn,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

final shipments = [
  Shipment(
    id: '#NEJ20089934122231',
    name: 'Macbook Pro M2',
    from: 'Paris',
    to: 'Morocco',
  ),
  Shipment(
    id: '#NEJ20089934122231',
    name: 'Summer linen jacket',
    from: 'Barcelona',
    to: 'Paris',
  ),
  Shipment(
    id: '#NEJ20089934122231',
    name: 'Tapered-fit jeans AW',
    from: 'Columbia',
    to: 'Paris',
  ),
  Shipment(
    id: '#NEJ20089934122231',
    name: 'Slim fit jeans AW',
    from: 'Bogota',
    to: 'Dhaka',
  ),
  Shipment(
    id: '#NEJ20089934122231',
    name: 'Office setup desk',
    from: 'France',
    to: 'Germany',
  ),
];
