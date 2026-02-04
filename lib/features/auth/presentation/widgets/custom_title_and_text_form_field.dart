import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/auth/presentation/widgets/custom_text_form_field.dart';

class CustomTitleAndTextFormField extends StatelessWidget {
  const CustomTitleAndTextFormField({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.styleRegular14(
            context,
          ).copyWith(color: AppColors.darkColor),
        ),
        const CustomTextFormField(hint: '70'),
      ],
    );
  }
}
