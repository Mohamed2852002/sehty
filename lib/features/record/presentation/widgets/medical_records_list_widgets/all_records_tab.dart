import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/medical_record_card.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/medical_record_list_view.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/record_empty_state.dart';

class AllRecordsTab extends StatelessWidget {
  final List<MedicalRecordEntity> records;

  const AllRecordsTab({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      return RecordEmptyState(
        message: context.l10n.noRecordsFound,
        icon: Icons.folder_open_outlined,
      );
    }

    return MedicalRecordListView(
      children: records
          .map(
            (record) => MedicalRecordCard(
              record: record,
              title: record.name ?? '',
              date: record.recordDate ?? '',
              type: _getTypeLabel(context, record.fileType),
              icon: _getTypeIcon(record.fileType),
            ),
          )
          .toList(),
    );
  }

  String _getTypeLabel(BuildContext context, String? fileType) {
    switch (fileType) {
      case 'lab_test':
        return context.l10n.analyses;
      case 'radiology':
        return context.l10n.xrays;
      case 'prescription':
        return context.l10n.prescriptions;
      default:
        return context.l10n.reports;
    }
  }

  IconData _getTypeIcon(String? fileType) {
    switch (fileType) {
      case 'lab_test':
        return Icons.description_outlined;
      case 'radiology':
        return Icons.image_outlined;
      case 'prescription':
        return Icons.medication_outlined;
      default:
        return Icons.assignment_outlined;
    }
  }
}
