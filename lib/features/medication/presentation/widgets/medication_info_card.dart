import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/medication/domain/entities/medication_entity.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_info_row.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_progress_indicator.dart';
import 'package:sehty/features/medication/presentation/widgets/schedule_chip.dart';

class MedicationInfoCard extends StatelessWidget {
  final MedicationEntity medication;

  const MedicationInfoCard({super.key, required this.medication});

  @override
  Widget build(BuildContext context) {
    final String medicineName = medication.name ?? '';
    final String dose = medication.dosage ?? '';
    final List<String> schedules =
        medication.schedules?.map((e) => e.time ?? '').toList() ?? [];
    final String duration =
        '${medication.totalQuantity ?? 0} ${context.l10n.day}'; // Simplified for now
    final String startDate = medication.startDate ?? '';
    final double complianceProgress = medication.percentage ?? 0.0;
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
                label: context.l10n.takingSchedules, // "Schedules:"
                icon: AppAssets.iconsMedicationsTimeIcon,
                child: Wrap(
                  spacing: 8,
                  children: schedules
                      .map((time) => ScheduleChip(time: time))
                      .toList(),
                ),
              ),
              MedicationInfoRow(
                label: context.l10n.duration,
                icon: AppAssets.iconsMedicationsCalenderIcon,
                value: duration,
              ),
              MedicationInfoRow(
                label: context.l10n.treatmentStart,
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
