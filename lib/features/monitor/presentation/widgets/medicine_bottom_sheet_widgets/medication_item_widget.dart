import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class MedicationItemWidget extends StatelessWidget {
  const MedicationItemWidget({
    super.key,
    required this.name,
    required this.dose,
    required this.scheduledTime,
    this.takenTime,
    required this.isTaken,
  });

  final String name;
  final String dose;
  final String scheduledTime;
  final String? takenTime;
  final bool isTaken;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isTaken ? const Color(0xffF0FDF4) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isTaken
              ? AppColors.greenColor.withValues(alpha: 0.2)
              : Colors.grey.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isTaken
                      ? AppColors.greenColor.withValues(alpha: 0.1)
                      : Colors.grey.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  isTaken
                      ? AppAssets.iconsMonitorMedicationIcon
                      : AppAssets.iconsMonitorGreyMedicationIcon,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(name, style: AppStyles.styleBold16(context)),
                    Text(
                      dose,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Icon(
                isTaken ? Icons.check_circle_outline : Icons.error_outline,
                color: isTaken ? AppColors.greenColor : AppColors.secondary,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (!isTaken) ...[
            const Divider(height: 1, color: Color(0xffF2F4F7)),
            const SizedBox(height: 12),
          ],
          Row(
            children: [
              if (isTaken && takenTime != null) ...[
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '${context.l10n.scheduledAt} $scheduledTime',
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
                const SizedBox(width: 4),
                const Text('•', style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 4),
                Text(
                  '${context.l10n.takenAt} $takenTime',
                  style: AppStyles.styleMedium14(
                    context,
                  ).copyWith(color: AppColors.greenColor),
                ),
              ],
            ],
          ),
          if (!isTaken) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  context.l10n.medicationNotConfirmed,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.heavyBlueColor),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
