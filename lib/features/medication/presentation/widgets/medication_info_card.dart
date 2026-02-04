import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_info_row.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_progress_indicator.dart';
import 'package:sehty/features/medication/presentation/widgets/schedule_chip.dart';

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
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsMedicationMedicineIcon),
              ),
            ],
          ),
          Column(
            spacing: 12,
            children: [
              MedicationInfoRow(
                label: AppStrings.takingSchedules, // "Schedules:"
                icon: AppAssets.iconsMedicationsTimeIcon,
                child: Wrap(
                  spacing: 8,
                  children: schedules
                      .map((time) => ScheduleChip(time: time))
                      .toList(),
                ),
              ),
              MedicationInfoRow(
                label: AppStrings.duration,
                icon: AppAssets.iconsMedicationsCalenderIcon,
                value: duration,
              ),
              MedicationInfoRow(
                label: AppStrings.treatmentStart,
                icon: AppAssets.iconsMedicationsCalenderIcon,
                value: startDate,
              ),
            ],
          ),
          MedicationProgressIndicator(progress: complianceProgress),
        ],
      ),
    );
  }
}
