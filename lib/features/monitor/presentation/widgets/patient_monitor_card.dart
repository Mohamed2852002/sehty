import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class PatientMonitorCard extends StatelessWidget {
  final String name;
  final String relation;
  final String phone;
  final String progress;
  final double progressValue;
  final String takenMedications;
  final String totalMedications;
  final Color progressColor;
  final Color backgroundColor;

  const PatientMonitorCard({
    super.key,
    required this.name,
    required this.relation,
    required this.phone,
    required this.progress,
    required this.progressValue,
    required this.takenMedications,
    required this.totalMedications,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$relation - $name',
                      style: AppStyles.styleBold16(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phone,
                      style: AppStyles.styleRegular12(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(
                          progressValue == 1.0
                              ? Icons.check_circle_outline
                              : Icons.error_outline,
                          color: progressColor,
                          size: 18,
                        ),
                        Expanded(
                          child: Text(
                            '$takenMedications ${AppStrings.addMedicine} $totalMedications ${AppStrings.medicineForToday}', // "X of Y medications today"
                            style: AppStyles.styleMedium14(
                              context,
                            ).copyWith(color: const Color(0xff6A7282)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${AppStrings.weeklyCommitment} ${progressValue * 100}%',
                      style: AppStyles.styleMedium14(
                        context,
                      ).copyWith(color: progressColor),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    progress,
                    style: AppStyles.styleBold26(
                      context,
                    ).copyWith(color: progressColor, fontSize: 32),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.today, // "Today"
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.white,
              color: progressColor,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings
                        .viewMedicationDetails, // "View Medication Details"
                    style: AppStyles.styleMedium14(
                      context,
                    ).copyWith(color: AppColors.darkColor),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.darkColor,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
