import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';
import 'package:sehty/features/monitor/presentation/widgets/patient_monitor_card.dart';

class PatientsListSection extends StatelessWidget {
  const PatientsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      buildWhen: (previous, current) =>
          current is FamilyConnectionsLoaded ||
          current is MonitorLoading ||
          current is MonitorError,
      builder: (context, state) {
        if (state is MonitorLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MonitorError) {
          return Center(child: Text(state.message));
        } else if (state is FamilyConnectionsLoaded) {
          if (state.filteredMembers.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noPatientsFound,
                style: AppStyles.styleBold16(context),
              ),
            );
          }
          return CustomContainer(
            child: Column(
              spacing: 16,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(AppAssets.iconsMonitorHeartIcon),
                    Text(
                      context.l10n.patientsUnderCare,
                      style: AppStyles.styleBold16(context),
                    ),
                  ],
                ),
                ...state.filteredMembers.map(
                  (member) => PatientMonitorCard(member: member),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
