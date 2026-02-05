import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/monitor/presentation/widgets/medicine_bottom_sheet_widgets/medication_compliance_summary.dart';
import 'package:sehty/features/monitor/presentation/widgets/medicine_bottom_sheet_widgets/medication_item_widget.dart';
import 'package:sehty/features/monitor/presentation/widgets/medicine_bottom_sheet_widgets/shared_data_note_widget.dart';

class PatientMedicationBottomSheet extends StatelessWidget {
  const PatientMedicationBottomSheet({
    super.key,
    required this.patientName,
    required this.phoneNumber,
  });

  final String patientName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.80,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 12,
        ),
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'أدوية $patientName',
                        style: AppStyles.styleBold20(context),
                      ),
                      Text(
                        phoneNumber,
                        style: AppStyles.styleRegular14(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Compliance Summary
            const MedicationComplianceSummary(
              complianceRate: 67,
              takenCount: 2,
              totalCount: 3,
            ),
            const SizedBox(height: 24),

            // Divider
            const Divider(height: 0, color: Color(0xffF2F4F7)),
            const SizedBox(height: 24),
            // Medications List
            const Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MedicationItemWidget(
                      name: 'أسبرين',
                      dose: '100 ملغ',
                      scheduledTime: '08:00 ص',
                      takenTime: '08:05 ص',
                      isTaken: true,
                    ),
                    MedicationItemWidget(
                      name: 'ميتفورمين',
                      dose: '500 ملغ',
                      scheduledTime: '12:00 م',
                      takenTime: '12:10 م',
                      isTaken: true,
                    ),
                    MedicationItemWidget(
                      name: 'أملوديبين',
                      dose: '5 ملغ',
                      scheduledTime: '08:00 م',
                      isTaken: false,
                    ),
                  ],
                ),
              ),
            ),
            // Footer Note
            const SharedDataNoteWidget(),
          ],
        ),
      ),
    );
  }
}
