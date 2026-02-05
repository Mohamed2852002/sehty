import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';
import 'package:sehty/main_shell/widgets/nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          NavItem(
            index: 0,
            iconPath: AppAssets.iconsHomeNavBar,
            label: context.l10n.home,
            isSelected: context.watch<MainShellCubit>().currentIndex == 0,
          ),
          NavItem(
            index: 1,
            iconPath: AppAssets.iconsMedicationNavBar,
            label: context.l10n.medications,
            isSelected: context.watch<MainShellCubit>().currentIndex == 1,
          ),
          NavItem(
            index: 2,
            iconPath: AppAssets.iconsHomeRecordIcon,
            label: context.l10n.medicalRecord,
            isSelected: context.watch<MainShellCubit>().currentIndex == 2,
          ),
          NavItem(
            index: 3,
            iconPath: AppAssets.iconsFamilyNavBar,
            label: context.l10n.familyTracking,
            isSelected: context.watch<MainShellCubit>().currentIndex == 3,
          ),
          NavItem(
            index: 4,
            iconPath: AppAssets.iconsProfileNavBar,
            label: context.l10n.profile,
            isSelected: context.watch<MainShellCubit>().currentIndex == 4,
          ),
        ],
      ),
    );
  }
}
