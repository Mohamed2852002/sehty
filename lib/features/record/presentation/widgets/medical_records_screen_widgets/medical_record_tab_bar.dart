import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';

class MedicalRecordTabBar extends StatelessWidget {
  final List<String> categories;

  const MedicalRecordTabBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TabBar(
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.darkColor,
        labelStyle: AppStyles.styleBold16(context),
        unselectedLabelStyle: AppStyles.styleMedium16(context),
        tabAlignment: TabAlignment.start,
        tabs: categories
            .map(
              (category) => Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Center(child: Text(category)),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
