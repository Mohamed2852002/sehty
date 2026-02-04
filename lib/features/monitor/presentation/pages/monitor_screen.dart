import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_button_widget.dart';
import 'package:sehty/features/monitor/presentation/widgets/family_tip_card.dart';
import 'package:sehty/features/monitor/presentation/widgets/monitor_header.dart';
import 'package:sehty/features/monitor/presentation/widgets/monitor_stats_card.dart';
import 'package:sehty/features/monitor/presentation/widgets/patient_monitor_card.dart';
import 'package:sehty/features/monitor/presentation/widgets/pending_requests_section.dart';

class MonitorScreen extends StatelessWidget {
  const MonitorScreen({super.key});

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
                const MonitorHeader(),
             
          
                const MonitorStatsCard(),
           
          
              const AddPatientButtonWidget(),
           
          
              const PendingRequestsSection(),
           
          
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'المرضى تحت الرعاية (2)', // "Patients Under Care (2)"
                    style: AppStyles.styleBold16(context),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.favorite_border,
                    color: AppColors.primary.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ],
              ),
          
              PatientMonitorCard(
                name: 'محمد',
                relation: AppStrings.father, // "My Father"
                phone: '0501234567',
                progress: '100%',
                progressValue: 1.0,
                takenMedications: '3',
                totalMedications: '3',
                progressColor: AppColors.greenColor,
                backgroundColor: const Color(0xffE6F9EA),
              ),
              PatientMonitorCard(
                name: 'فاطمة', // "Fatima"
                relation: AppStrings
                    .motherFatima, // Using "My Mother - Fatima" string roughly, or hardcoded for now
                phone: '0507654321',
                progress: '66%',
                progressValue: 0.66,
                takenMedications: '2',
                totalMedications: '3',
                progressColor: const Color(0xffF9A825), // Orange/Yellow
                backgroundColor: const Color(0xffFFFDE7),
              ),
              const FamilyTipCard(),
            ]),
          ),
        ],
      ),
    );
  }
}
