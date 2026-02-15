import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/home/presentation/bloc/home_bloc.dart';
import 'package:sehty/features/home/presentation/widgets/family_member_dialogu_widgets/family_member_dialog.dart';
import 'package:sehty/features/home/presentation/widgets/family_empty_state.dart';
import 'package:sehty/features/home/presentation/widgets/family_member_item.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';

class FamilyFollowUpWidget extends StatefulWidget {
  const FamilyFollowUpWidget({super.key});

  @override
  State<FamilyFollowUpWidget> createState() => _FamilyFollowUpWidgetState();
}

class _FamilyFollowUpWidgetState extends State<FamilyFollowUpWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MonitorBloc>().add(GetFamilyConnectionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsHomeFamilyIcon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.l10n.familyTracking,
                  style: AppStyles.styleBold20(context),
                ),
              ),
              CustomButton(
                borderRadius: 20,
                content: Row(
                  spacing: 4,
                  children: [
                    Text(
                      context.l10n.add,
                      style: AppStyles.styleBold14(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    const Icon(Icons.add, color: Colors.white),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (childContext) => BlocProvider.value(
                      value: context.read<MonitorBloc>(),
                      child: const FamilyMemberDialog(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                current is HomeError || current is HomeLoaded,
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeError) {
                return Center(child: Text(state.message));
              } else if (state is HomeLoaded) {
                final members = state.dashboard.familyMonitoring?.members;
                if (members == null || members.isEmpty) {
                  return const FamilyEmptyState();
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: members.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return FamilyMemberItem(member: member);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
