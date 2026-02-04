import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({super.key, required this.value});
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
          Text(value, style: AppStyles.styleRegular14(context)),
        ],
      ),
    );
  }
}
