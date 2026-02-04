import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/features/home/presentation/widgets/medication_list_item.dart';

class MedicationList extends StatelessWidget {
  const MedicationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        MedicationListItem(
          medicineName: AppStrings.aspirin, // "Aspirin"
          time: '08:00 ',
          status: MedicationStatus.taken,
        ),
        MedicationListItem(
          medicineName: AppStrings.metformin, // "Metformin"
          time: '12:00 ',
          status: MedicationStatus.taken,
        ),
        MedicationListItem(
          medicineName: AppStrings.amlodipine, // "Amlodipine"
          time: '08:00 ',
          status: MedicationStatus.pending, // Pending/Late (Red dot)
        ),
      ],
    );
  }
}
