import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_styles.dart';

class NotificationButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const NotificationButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppStyles.styleBold14(context).copyWith(color: textColor),
        ),
      ),
    );
  }
}
