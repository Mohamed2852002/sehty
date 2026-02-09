import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_drop_down_menu.dart';

class CustomTitleAndDropDownMenu extends StatelessWidget {
  const CustomTitleAndDropDownMenu({
    super.key,
    required this.label,
    this.value,
    this.items = const [],
    this.onChanged,
    this.onSaved,
    this.dropDownIconVisible = true,
  });
  final String label;
  final String? value;
  final List<String> items;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final bool dropDownIconVisible;

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
        CustomDropDownMenu(
          value: value,
          items: items,
          onChanged: onChanged ?? (val) {},
          onSaved: onSaved,
          hint: label,
          dropDownIconVisible: dropDownIconVisible,
        ),
      ],
    );
  }
}
