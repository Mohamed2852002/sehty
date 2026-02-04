import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
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
            label: AppStrings.home,
            isSelected: context.watch<MainShellCubit>().currentIndex == 0,
          ),
          NavItem(
            index: 1,
            iconPath: AppAssets.iconsMedicationNavBar,
            label: AppStrings.medications,
            isSelected: context.watch<MainShellCubit>().currentIndex == 1,
          ),
          NavItem(
            index: 2,
            iconPath: AppAssets.iconsHomeRecordIcon,
            label: AppStrings.medicalRecord,
            isSelected: context.watch<MainShellCubit>().currentIndex == 2,
          ),
          NavItem(
            index: 3,
            iconPath: AppAssets.iconsFamilyNavBar,
            label: AppStrings.familyTracking,
            isSelected: context.watch<MainShellCubit>().currentIndex == 3,
          ),
          NavItem(
            index: 4,
            iconPath: AppAssets.iconsProfileNavBar,
            label: AppStrings.profile,
            isSelected: context.watch<MainShellCubit>().currentIndex == 4,
          ),
        ],
      ),
    );
  }
}
