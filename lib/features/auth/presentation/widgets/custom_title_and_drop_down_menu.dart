import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/auth/presentation/widgets/custom_drop_down_menu.dart';

class CustomTitleAndDropDownMenu extends StatelessWidget {
  const CustomTitleAndDropDownMenu({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.styleRegular14(
            context,
          ).copyWith(color: AppColors.darkColor),
        ),
        const SizedBox(height: 8),
        const CustomDropDownMenu(value: 'القاهرة'),
      ],
    );
  }
}
