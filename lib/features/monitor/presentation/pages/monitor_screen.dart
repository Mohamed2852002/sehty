import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_button_widget.dart';
import 'package:sehty/features/monitor/presentation/widgets/family_tip_card.dart';
import 'package:sehty/features/monitor/presentation/widgets/monitor_header.dart';
import 'package:sehty/features/monitor/presentation/widgets/monitor_stats_card.dart';
import 'package:sehty/features/monitor/presentation/widgets/patient_monitor_card.dart';
import 'package:sehty/features/monitor/presentation/widgets/pending_requests_section.dart';

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
                BlocBuilder<MonitorBloc, MonitorState>(
                  builder: (context, state) {
                    if (state is MonitorLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MonitorError) {
                      return Center(child: Text(state.message));
                    } else if (state is FamilyConnectionsLoaded) {
                      if (state.members.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return CustomContainer(
                        child: Column(
                          spacing: 16,
                          children: [
                            Row(
                              spacing: 8,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.iconsMonitorHeartIcon,
                                ),
                                Text(
                                  context.l10n.patientsUnderCare,
                                  style: AppStyles.styleBold16(context),
                                ),
                              ],
                            ),
                            ...state.members.map(
                              (member) => PatientMonitorCard(member: member),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const FamilyTipCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
