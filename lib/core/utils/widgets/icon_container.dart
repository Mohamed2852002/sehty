import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color ?? AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
