import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_text_form_field.dart';

class CustomTitleAndTextFormField extends StatelessWidget {
  const CustomTitleAndTextFormField({
    super.key,
    required this.label,
    required this.hint,
  });
  final String label;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.styleRegular16(
            context,
          ).copyWith(color: AppColors.darkColor),
        ),
        CustomTextFormField(hint: hint),
      ],
    );
  }
}
