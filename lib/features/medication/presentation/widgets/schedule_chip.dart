import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';

class ScheduleChip extends StatelessWidget {
  const ScheduleChip({super.key, required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffE0F7FA),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        time,
        style: AppStyles.styleMedium12(
          context,
        ).copyWith(color: AppColors.primary),
      ),
    );
  }
}
