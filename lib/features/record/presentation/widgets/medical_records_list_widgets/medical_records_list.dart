import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/record/presentation/bloc/record_bloc.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/all_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/analysis_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/error_record_widget.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/prescriptions_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/reports_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/xrays_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/medical_records_list_widgets/record_empty_state.dart';

class MedicalRecordsList extends StatefulWidget {
  const MedicalRecordsList({super.key});

  @override
  State<MedicalRecordsList> createState() => _MedicalRecordsListState();
}

class _MedicalRecordsListState extends State<MedicalRecordsList> {
  @override
  void initState() {
    super.initState();
    context.read<RecordBloc>().add(GetMedicalRecordsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordBloc, RecordState>(
      builder: (context, state) {
        if (state is RecordLoading) {
          return const TabBarView(
            children: [
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }

        if (state is RecordError) {
          return TabBarView(
            children: [
              ErrorRecordWidget(message: state.message),
              ErrorRecordWidget(message: state.message),
              ErrorRecordWidget(message: state.message),
              ErrorRecordWidget(message: state.message),
              ErrorRecordWidget(message: state.message),
            ],
          );
        }

        if (state is MedicalRecordsLoaded) {
          final allRecords = state.records;
          final labTestRecords = allRecords
              .where((r) => r.fileType == 'lab_test')
              .toList();
          final radiologyRecords = allRecords
              .where((r) => r.fileType == 'radiology')
              .toList();
          final reportsRecords = allRecords
              .where((r) => r.fileType == 'report')
              .toList();
          final prescriptionRecords = allRecords
              .where((r) => r.fileType == 'prescription')
              .toList();

          return TabBarView(
            children: [
              AllRecordsTab(records: allRecords),
              AnalysisRecordsTab(records: labTestRecords),
              XraysRecordsTab(records: radiologyRecords),
              ReportsRecordsTab(records: reportsRecords),
              PrescriptionsRecordsTab(records: prescriptionRecords),
            ],
          );
        }

        // Initial state — show empty
        return TabBarView(
          children: [
            RecordEmptyState(
              message: context.l10n.noRecordsFound,
              icon: Icons.folder_open_outlined,
            ),
            RecordEmptyState(
              message: context.l10n.noAnalysisRecords,
              icon: Icons.description_outlined,
            ),
            RecordEmptyState(
              message: context.l10n.noXrayRecords,
              icon: Icons.image_outlined,
            ),
            RecordEmptyState(
              message: context.l10n.noReportsRecords,
              icon: Icons.assignment_outlined,
            ),
            RecordEmptyState(
              message: context.l10n.noPrescriptionRecords,
              icon: Icons.medication_outlined,
            ),
          ],
        );
      },
    );
  }
}
