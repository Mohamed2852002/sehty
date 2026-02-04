import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_card.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_list_view.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_tab_bar.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_tab_bar_delegate.dart';
import 'package:sehty/features/record/presentation/widgets/record_header.dart';
import 'package:sehty/features/record/presentation/widgets/security_note_card.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      AppStrings.all,
      AppStrings.analyses,
      AppStrings.xrays,
      AppStrings.reports,
      AppStrings.prescriptions,
    ];

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverToBoxAdapter(
                child: Column(
                  spacing: 24,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [RecordHeader(), SecurityNoteCard()],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: MedicalRecordTabBarDelegate(
                  child: MedicalRecordTabBar(categories: categories),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildAllTab(),
              _buildAnalysesTab(),
              _buildXraysTab(),
              _buildReportsTab(),
              _buildPrescriptionsTab(),
            ], // Reversed for RTL feel
          ),
        ),
      ),
    );
  }

  Widget _buildAllTab() {
    return MedicalRecordListView(
      children: [
        MedicalRecordCard(
          title: AppStrings.bloodSugarAnalysis,
          date: '2026/1/10',
          type: AppStrings.analyses,
          icon: Icons.description_outlined,
        ),
        MedicalRecordCard(
          title: AppStrings.chestXray,
          date: '2026/1/15',
          type: AppStrings.xrays,
          icon: Icons.image_outlined,
        ),
        MedicalRecordCard(
          title: AppStrings.doctorReport,
          date: '2026/1/10',
          type: AppStrings.reports,
          icon: Icons.assignment_outlined,
        ),
      ],
    );
  }

  Widget _buildAnalysesTab() {
    return MedicalRecordListView(
      children: [
        MedicalRecordCard(
          title: AppStrings.bloodSugarAnalysis,
          date: '2026/1/10',
          type: AppStrings.analyses,
          icon: Icons.description_outlined,
        ),
      ],
    );
  }

  Widget _buildXraysTab() {
    return MedicalRecordListView(
      children: [
        MedicalRecordCard(
          title: AppStrings.chestXray,
          date: '2026/1/15',
          type: AppStrings.xrays,
          icon: Icons.image_outlined,
        ),
      ],
    );
  }

  Widget _buildReportsTab() {
    return MedicalRecordListView(
      children: [
        MedicalRecordCard(
          title: AppStrings.doctorReport,
          date: '2026/1/10',
          type: AppStrings.reports,
          icon: Icons.assignment_outlined,
        ),
      ],
    );
  }

  Widget _buildPrescriptionsTab() {
    return const MedicalRecordListView(children: []);
  }
}
