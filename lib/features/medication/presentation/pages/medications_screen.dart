import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_header.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_info_card.dart';
import 'package:sehty/features/medication/presentation/widgets/medication_reminder_card.dart';

class MedicationsScreen extends StatelessWidget {
  const MedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 24,
              children: [
                const MedicationHeader(),
                const MedicationReminderCard(),
                MedicationInfoCard(
                  medicineName: AppStrings.aspirin,
                  dose: AppStrings.mg100,
                  schedules: const ['08:00 ص'],
                  duration: '30 يوم',
                  startDate: '2026/1/1',
                  complianceProgress: 0.6,
                ),
                MedicationInfoCard(
                  medicineName: AppStrings.metformin,
                  dose: AppStrings.mg500,
                  schedules: const ['08:00 ص', '08:00 م'],
                  duration: '90 يوم',
                  startDate: '2026/1/1',
                  complianceProgress: 0.6,
                ),
                MedicationInfoCard(
                  medicineName: AppStrings.amlodipine,
                  dose: AppStrings.mg5,
                  schedules: const ['08:00 م'],
                  duration: '60 يوم',
                  startDate: '2026/1/15',
                  complianceProgress: 0.6,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
