import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyles.styleRegular14(context),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
