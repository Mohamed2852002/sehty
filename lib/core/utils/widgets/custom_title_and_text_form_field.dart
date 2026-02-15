import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_text_form_field.dart';

class CustomTitleAndTextFormField extends StatelessWidget {
  const CustomTitleAndTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.onSaved,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.validator,
  });
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
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
        CustomTextFormField(
          hint: hint,
          keyboardType: keyboardType,
          onSaved: onSaved,
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
        ),
      ],
    );
  }
}
