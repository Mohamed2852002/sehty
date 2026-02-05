import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class MedicationComplianceSummary extends StatelessWidget {
  const MedicationComplianceSummary({
    super.key,
    required this.complianceRate,
    required this.takenCount,
    required this.totalCount,
  });

  final int complianceRate;
  final int takenCount;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.primary.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.transparentDarkPrimary),
      ),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.todayComplianceRate,
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
              Text(
                '$complianceRate%',
                style: AppStyles.styleBold20(context).copyWith(
                  color: const Color(0xffFBC02D), // Yellow from design
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: complianceRate / 100,
              backgroundColor: Colors.grey.withValues(alpha: 0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xffFBC02D),
              ),
              minHeight: 8,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$takenCount ${context.l10n.from} $totalCount ${context.l10n.medications}',
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
              Text(
                context.l10n.needsFollowUp,
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
