import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.validator,
    this.suffixIcon,
  });
  final String hint;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).enter_a_value;
            }
            return null;
          },
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(12),
        hintText: hint,
        hintStyle: AppStyles.styleRegular14(context),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffE5E7EB)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffE5E7EB)),
        ),
      ),
    );
  }
}
