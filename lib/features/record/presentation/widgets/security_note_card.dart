import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class SecurityNoteCard extends StatelessWidget {
  const SecurityNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF0FDF4), // Light Green
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greenColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              const Icon(Icons.lock, color: AppColors.greenColor, size: 18),
              Text(
                AppStrings.filesSecurityTitle, // "Your files security:"
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.greenColor),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings
                .filesSecurityNote, // "All your medical files are encrypted..."
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: AppColors.greenColor, height: 1.5),
          ),
        ],
      ),
    );
  }
}
