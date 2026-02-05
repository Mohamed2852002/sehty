import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';

class AddMedicationDialog extends StatelessWidget {
  const AddMedicationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.addNewMedication,
                  style: AppStyles.styleBold20(context),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.grey),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffEFFBFF), // Very light blue
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffD0F0FB)),
            ),
            child: Text(
              context.l10n.medicationReminderNote,
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: const Color(0xff27BED7), height: 1.5),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            spacing: 16,
            children: [
              CustomTitleAndTextFormField(
                label: context.l10n.medicineName,
                hint: context.l10n.medicineNameExample,
              ),
              CustomTitleAndTextFormField(
                label: context.l10n.dose,
                hint: context.l10n.doseExample,
              ),
              CustomTitleAndTextFormField(
                label: context.l10n.takingSchedules,
                hint: context.l10n.takingSchedules,
              ),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              // Add another schedule logic
            },
            child: Row(
              spacing: 4,
              children: [
                const Icon(Icons.add, color: Color(0xff26C6DA)),
                Text(
                  context.l10n.addAnotherSchedule,
                  style: AppStyles.styleBold14(
                    context,
                  ).copyWith(color: const Color(0xff26C6DA)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomTitleAndTextFormField(
                  label: context.l10n.startDate,
                  hint: context.l10n.startDate,
                ),
              ),
              Expanded(
                child: CustomTitleAndTextFormField(
                  label: context.l10n.daysCount,
                  hint: context.l10n.daysCount,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add medication
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff26C6DA),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.l10n.addMedication,
                    style: AppStyles.styleBold16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffE9EEF0),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    context.l10n.cancel,
                    style: AppStyles.styleBold16(
                      context,
                    ).copyWith(color: const Color(0xff6A7282)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
