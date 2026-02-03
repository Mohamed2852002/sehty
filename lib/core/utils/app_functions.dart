import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';

class AppFunctions {
  static void showCustomSnackBar(
    BuildContext context,
    String message, {
    Color? backgroundColor = AppColors.primary,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Text(
          message,
          style: AppStyles.styleSemiBold14(
            context,
          ).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
