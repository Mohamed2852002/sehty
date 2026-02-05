import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

enum MedicationStatus { taken, missed, pending }

class MedicationListItem extends StatelessWidget {
  final String medicineName;
  final String time;
  final MedicationStatus status;

  const MedicationListItem({
    super.key,
    required this.medicineName,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    Color backgroundColor;
    IconData icon;
    Color iconColor;

    switch (status) {
      case MedicationStatus.taken:
        statusColor = AppColors.greenColor;
        backgroundColor = AppColors.greenColor.withValues(alpha: 0.05);
        icon = Icons.check_circle_outline;
        iconColor = AppColors.greenColor;
        break;
      case MedicationStatus.missed:
        statusColor = Colors.red;
        backgroundColor = Colors.red.withValues(alpha: 0.05);
        icon = Icons.cancel_outlined; // Or similar
        iconColor = Colors.red;
        break;
      case MedicationStatus.pending:
        statusColor = Colors.grey;
        backgroundColor = Colors.white; // Or similar
        icon = Icons.circle_outlined;
        iconColor = Colors.grey;
        break;
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusColor.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(medicineName, style: AppStyles.styleBold16(context)),
                Text(
                  time,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          if (status == MedicationStatus.pending) ...[
            // Action Button
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  context.l10n.confirmTaking,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
            ),
          ] else ...[
            Icon(icon, color: iconColor, size: 28),
          ],
        ],
      ),
    );
  }
}
