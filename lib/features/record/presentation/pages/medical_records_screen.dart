import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/features/record/presentation/widgets/category_filter_list.dart';
import 'package:sehty/features/record/presentation/widgets/medical_record_card.dart';
import 'package:sehty/features/record/presentation/widgets/record_header.dart';
import 'package:sehty/features/record/presentation/widgets/security_note_card.dart';
import 'package:sehty/features/record/presentation/widgets/share_tip_card.dart';

class MedicalRecordsScreen extends StatelessWidget {
  const MedicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RecordHeader(),
                const SizedBox(height: 24),
          
                const SecurityNoteCard(),
              const SizedBox(height: 24),
          
              const CategoryFilterList(),
              const SizedBox(height: 24),
          
              MedicalRecordCard(
                title:
                    AppStrings.bloodSugarAnalysis, // "Blood Sugar Analysis"
                date: '2026/1/10',
                type: AppStrings.analyses, // "Analyses"
                icon: Icons.description_outlined,
              ),
              const SizedBox(height: 16),
          
              MedicalRecordCard(
                title: AppStrings.chestXray, // "Chest X-ray"
                date: '2026/1/15',
                type: AppStrings.xrays, // "X-rays"
                icon: Icons.image_outlined,
              ),
              const SizedBox(height: 16),
          
              MedicalRecordCard(
                title: AppStrings.doctorReport, // "Doctor Report"
                date: '2026/1/10',
                type: AppStrings.reports, // "Reports"
                icon: Icons.assignment_outlined,
              ),
              const SizedBox(height: 24),
          
              const ShareTipCard(),
              const SizedBox(height: 40),
            ]),
          ),
        ],
      ),
    );
  }
}
