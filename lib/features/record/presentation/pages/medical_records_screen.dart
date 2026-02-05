import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/record/presentation/widgets/all_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/analysis_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_tab_bar.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_tab_bar_delegate.dart';
import 'package:sehty/features/record/presentation/widgets/prescriptions_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/record_header.dart';
import 'package:sehty/features/record/presentation/widgets/reports_records_tab.dart';
import 'package:sehty/features/record/presentation/widgets/security_note_card.dart';
import 'package:sehty/features/record/presentation/widgets/xrays_records_tab.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      context.l10n.all,
      context.l10n.analyses,
      context.l10n.xrays,
      context.l10n.reports,
      context.l10n.prescriptions,
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
          body: const TabBarView(
            children: [
              AllRecordsTab(),
              AnalysisRecordsTab(),
              XraysRecordsTab(),
              ReportsRecordsTab(),
              PrescriptionsRecordsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
