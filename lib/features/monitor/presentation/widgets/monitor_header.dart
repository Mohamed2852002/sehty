import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/custom_text_form_field.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/core/utils/widgets/notification_bottom_sheet_widgets/notification_bottom_sheet.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';

class MonitorHeader extends StatefulWidget {
  const MonitorHeader({super.key});

  @override
  State<MonitorHeader> createState() => _MonitorHeaderState();
}

class _MonitorHeaderState extends State<MonitorHeader> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Row(
          spacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.gradientBtnColors,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(AppAssets.iconsMonitorPeopleIcon),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.familyTracking, // "Family Tracking"
                    style: AppStyles.styleBold20(context),
                  ),
                  Text(
                    context
                        .l10n
                        .reassureLovedOnes, // "Reassure on your loved ones..."
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: AppColors.darkColor),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const NotificationBottomSheet(),
                );
              },
              child: Stack(
                children: [
                  IconContainer(
                    color: const Color(0xffD9FAFF),
                    child: SvgPicture.asset(
                      AppAssets.iconsHomeNotificationBell,
                    ),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        CustomContainer(
          child: BlocBuilder<MonitorBloc, MonitorState>(
            buildWhen: (previous, current) =>
                current is FamilyConnectionsLoaded ||
                previous is FamilyConnectionsLoaded,
            builder: (context, state) {
              bool isSearching = false;
              if (state is FamilyConnectionsLoaded) {
                isSearching = state.isSearching;
              }
              return CustomTextFormField(
                hint: context.l10n.searchPatient,
                controller: _searchController,
                suffixIcon: isSearching
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(),
                      )
                    : _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          context.read<MonitorBloc>().add(
                            const ClearSearchFamilyMemberEvent(),
                          );
                          setState(() {});
                        },
                      )
                    : SvgPicture.asset(
                        AppAssets.iconsMonitorSearchIcon,
                        fit: BoxFit.scaleDown,
                      ),
                onChanged: (value) {
                  context.read<MonitorBloc>().add(
                    SearchFamilyMembersEvent(query: value),
                  );
                  setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
