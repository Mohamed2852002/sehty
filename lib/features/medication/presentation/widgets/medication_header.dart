import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

import 'package:sehty/features/medication/presentation/widgets/add_medication_dialog.dart';

class MedicationHeader extends StatelessWidget {
  const MedicationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                context.l10n.medications, // "Medications"
                style: AppStyles.styleBold24(context),
              ),
              Text(
                context
                    .l10n
                    .manageMedications, // "Manage your medications and schedules"
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const AddMedicationDialog(),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }
}
