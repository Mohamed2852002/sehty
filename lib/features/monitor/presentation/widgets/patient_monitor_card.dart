import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_entity.dart';
import 'package:sehty/features/monitor/presentation/widgets/medicine_bottom_sheet_widgets/patient_medication_bottom_sheet.dart';

class PatientMonitorCard extends StatelessWidget {
  final FamilyMemberEntity member;

  const PatientMonitorCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final double progressValue = (member.percentage ?? 0) / 100;
    final int percentage = member.percentage ?? 0;
    // Determine colors based on progress (example logic, can be refined)
    final Color progressColor = percentage >= 50
        ? AppColors.greenColor
        : const Color(0xffF9A825);
    final Color backgroundColor = percentage >= 50
        ? const Color(0xffE6F9EA)
        : const Color(0xffFFFDE7);

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
                      '${member.relationship ?? ''} - ${member.name ?? ''}',
                      style: AppStyles.styleBold16(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      member.phone ?? '',
                      style: AppStyles.styleRegular12(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(
                          percentage == 100
                              ? Icons.check_circle_outline
                              : Icons.error_outline,
                          color: progressColor,
                          size: 18,
                        ),
                        Expanded(
                          child: Text(
                            '${member.takenToday ?? 0} ${context.l10n.addMedicine} ${member.totalToday ?? 0} ${context.l10n.medicineForToday}',
                            style: AppStyles.styleMedium14(
                              context,
                            ).copyWith(color: const Color(0xff6A7282)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${context.l10n.weeklyCommitment} $percentage%',
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
                    '$percentage%',
                    style: AppStyles.styleBold26(
                      context,
                    ).copyWith(color: progressColor, fontSize: 32),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.l10n.today,
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
          CustomButton(
            verticalPadding: 16,
            color: Colors.white,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.viewMedicationDetails,
                  style: AppStyles.styleMedium14(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.darkColor,
                ),
              ],
            ),
            onTap: () {
              if (member.id != null) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => PatientMedicationBottomSheet(
                    memberId: member.id!,
                    patientName: member.name ?? '',
                    phoneNumber: member.phone ?? '',
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
