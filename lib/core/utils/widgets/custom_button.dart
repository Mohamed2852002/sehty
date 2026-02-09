import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.content,
    this.onTap,
    this.color = AppColors.primary,
    this.borderRadius = 10,
    this.verticalPadding = 10,
  });
  final Widget content;
  final VoidCallback? onTap;
  final Color color;
  final double borderRadius;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: 12,
        ),
        elevation: 0,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onTap,
      child: content,
    );
  }
}
