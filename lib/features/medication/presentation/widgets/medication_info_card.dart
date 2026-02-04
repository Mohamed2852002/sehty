import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_progress_indicator.dart';

class MedicationInfoCard extends StatelessWidget {
  final String medicineName;
  final String dose;
  final List<String> schedules;
  final String duration;
  final String startDate;
  final double complianceProgress;

  const MedicationInfoCard({
    super.key,
    required this.medicineName,
    required this.dose,
    required this.schedules,
    required this.duration,
    required this.startDate,
    required this.complianceProgress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xffE0F7FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.link,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(medicineName, style: AppStyles.styleBold20(context)),
                    Text(
                      dose,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Row for Schedules
          _buildInfoRow(
            context,
            label: AppStrings.takingSchedules, // "Schedules:"
            icon: Icons.access_time,
            child: Wrap(
              spacing: 8,
              children: schedules
                  .map((time) => _buildScheduleChip(context, time))
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),

          // Row for Duration
          _buildInfoRow(
            context,
            label: AppStrings.duration, // "Duration:"
            icon: Icons.calendar_today,
            value: duration,
          ),
          const SizedBox(height: 12),

          // Row for Start Date
          _buildInfoRow(
            context,
            label: AppStrings.treatmentStart, // "Treatment Start:"
            icon: Icons.calendar_month,
            value: startDate,
          ),

          const SizedBox(height: 20),
          MedicationProgressIndicator(progress: complianceProgress),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required IconData icon,
    String? value,
    Widget? child,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (value != null) Text(value, style: AppStyles.styleMedium14(context)),
        if (child != null) child,
        const SizedBox(width: 8),
        Text(
          '$label :',
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
        ),
        const SizedBox(width: 8),
        Icon(icon, color: AppColors.primary, size: 18),
      ],
    );
  }

  Widget _buildScheduleChip(BuildContext context, String time) {
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
