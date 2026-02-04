import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class CategoryFilterList extends StatefulWidget {
  const CategoryFilterList({super.key});

  @override
  State<CategoryFilterList> createState() => _CategoryFilterListState();
}

class _CategoryFilterListState extends State<CategoryFilterList> {
  int _selectedIndex = 0;

  final List<String> _categories = [
    AppStrings.all,
    AppStrings.analyses,
    AppStrings.xrays,
    AppStrings.reports,
    AppStrings.prescriptions,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Start from right for RTL
        children: List.generate(_categories.length, (index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.grey.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  _categories[index],
                  style: AppStyles.styleMedium14(context).copyWith(
                    color: isSelected ? Colors.white : AppColors.darkColor,
                  ),
                ),
              ),
            ),
          );
        }).reversed.toList(), // Reverse for visual RTL in Row
      ),
    );
  }
}
