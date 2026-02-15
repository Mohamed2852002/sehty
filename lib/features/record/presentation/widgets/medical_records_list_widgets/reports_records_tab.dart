import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/medical_record_card.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/medical_record_list_view.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/record_empty_state.dart';

class ReportsRecordsTab extends StatelessWidget {
  final List<MedicalRecordEntity> records;
  const ReportsRecordsTab({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      return RecordEmptyState(
        message: context.l10n.noReportsRecords,
        icon: Icons.assignment_outlined,
      );
    }
    return MedicalRecordListView(
      children: records
          .map((record) => MedicalRecordCard(record: record))
          .toList(),
    );
  }
}
