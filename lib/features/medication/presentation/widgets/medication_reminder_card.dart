import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class MedicationReminderCard extends StatelessWidget {
  const MedicationReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffEFFBFF), // Very light blue
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffD0F0FB)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.l10n.rememberNote,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: const Color(0xff1A1C1E)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.medicationReminderNote,
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: const Color(0xff6A7282), height: 1.5),
          ),
        ],
      ),
    );
  }
}
