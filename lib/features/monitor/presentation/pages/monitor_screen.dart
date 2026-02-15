import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_button_widget.dart';
import 'package:sehty/features/monitor/presentation/widgets/family_tip_card.dart';
import 'package:sehty/features/monitor/presentation/widgets/monitor_header.dart';
import 'package:sehty/features/monitor/presentation/widgets/monitor_stats_cards_section.dart';
import 'package:sehty/features/monitor/presentation/widgets/patients_list_section.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({super.key});

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MonitorBloc>().add(GetFamilyConnectionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MonitorBloc>().add(GetFamilyConnectionsEvent());
        },
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 24,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MonitorHeader(),
                  MonitorStatsCardsSection(),
                  AddPatientButtonWidget(),
                  // PendingRequestsSection(),
                  PatientsListSection(),
                  FamilyTipCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
