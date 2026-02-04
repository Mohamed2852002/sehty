import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';

class MedicationProgressIndicator extends StatelessWidget {
  final double progress; // 0.0 to 1.0

  const MedicationProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'تم الالتزام بنسبة ${(progress * 100).toInt()}% من المواعيد',
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: const Color(0xff6A7282)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: const Color(0xffE9EEF0),
            color: AppColors.primary,
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
