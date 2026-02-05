import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class AddMedicationDialog extends StatelessWidget {
  const AddMedicationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.grey),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  Text(
                    context.l10n.addNewMedication,
                    style: AppStyles.styleBold20(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffEFFBFF), // Very light blue
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xffD0F0FB)),
                ),
                child: Text(
                  context.l10n.medicationReminderNote,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular12(
                    context,
                  ).copyWith(color: const Color(0xff27BED7), height: 1.5),
                ),
              ),
              const SizedBox(height: 24),
              _buildFieldLabel(context, context.l10n.medicineName),
              const SizedBox(height: 8),
              _buildTextField(context, hint: context.l10n.medicineNameExample),
              const SizedBox(height: 16),
              _buildFieldLabel(context, context.l10n.dose),
              const SizedBox(height: 8),
              _buildTextField(context, hint: context.l10n.doseExample),
              const SizedBox(height: 16),
              _buildFieldLabel(context, context.l10n.takingSchedules),
              const SizedBox(height: 8),
              _buildTextField(context, readOnly: true),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  // Add another schedule logic
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.l10n.addAnotherSchedule,
                      style: AppStyles.styleBold14(
                        context,
                      ).copyWith(color: const Color(0xff26C6DA)),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.add, color: Color(0xff26C6DA), size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildFieldLabel(context, context.l10n.startDate),
                        const SizedBox(height: 8),
                        _buildTextField(context),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildFieldLabel(context, context.l10n.daysCount),
                        const SizedBox(height: 8),
                        _buildTextField(context, initialValue: '30'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
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
        ),
      ),
    );
  }

  Widget _buildFieldLabel(BuildContext context, String label) {
    return Text(
      label,
      textAlign: TextAlign.right,
      style: AppStyles.styleRegular14(
        context,
      ).copyWith(color: const Color(0xff1A1C1E)),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    String? hint,
    String? initialValue,
    bool readOnly = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE1E3E5)),
      ),
      child: TextFormField(
        initialValue: initialValue,
        readOnly: readOnly,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyles.styleRegular14(
            context,
          ).copyWith(color: const Color(0xffA0A5AA)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: AppStyles.styleRegular14(context),
      ),
    );
  }
}
