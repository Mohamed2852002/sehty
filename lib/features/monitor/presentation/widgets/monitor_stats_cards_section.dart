import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';
import 'package:sehty/features/monitor/presentation/widgets/monitor_stat_card.dart';

class MonitorStatsCardsSection extends StatelessWidget {
  const MonitorStatsCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      buildWhen: (previous, current) => current is FamilyConnectionsLoaded,
      builder: (context, state) {
        int pendingCount = 0;
        int approvedCount = 0;

        if (state is FamilyConnectionsLoaded) {
          pendingCount = state.members.statistics.pending;
          approvedCount = state.members.statistics.approved;
        }

        return Row(
          spacing: 16,
          children: [
            Expanded(
              child: MonitorStatCard(
                title: context.l10n.pending,
                count: pendingCount.toString(),
                color: const Color(0xffFFF8E1),
                iconColor: const Color(0xffF9A825),
                icon: Icons.person_add_alt_1_outlined,
              ),
            ),
            Expanded(
              child: MonitorStatCard(
                title: context.l10n.connected,
                count: approvedCount.toString(),
                color: const Color(0xffE6F9EA),
                iconColor: AppColors.greenColor,
                icon: Icons.people_outline,
              ),
            ),
          ],
        );
      },
    );
  }
}
