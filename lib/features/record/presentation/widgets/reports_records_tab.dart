import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_card.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_list_view.dart';

class ReportsRecordsTab extends StatelessWidget {
  const ReportsRecordsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MedicalRecordListView(
      children: [
        MedicalRecordCard(
          title: context.l10n.doctorReport,
          date: '2026/1/10',
          type: context.l10n.reports,
          icon: Icons.assignment_outlined,
        ),
      ],
    );
  }
}
