import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.index, required this.iconPath, required this.label, required this.isSelected});
  final int index;
  final String iconPath;
  final String label;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => context.read<MainShellCubit>().changeTab(index),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primary
                    : Colors.grey, // Or AppColors.darkColor/unselectedColor
                BlendMode.srcIn,
              ),
              height: 24, // Consistent size
              width: 24,
            ),
            const SizedBox(height: 4),
            FittedBox(
              child: Text(
                label,
                style: isSelected
                    ? AppStyles.styleBold12(
                        context,
                      ).copyWith(color: AppColors.primary)
                    : AppStyles.styleRegular12(
                        context,
                      ).copyWith(color: Colors.grey),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primary, // Or Cyan as in image
                  shape: BoxShape.circle,
                ),
              ),
            ] else
              // Add invisible spacer to prevent height jumping if needed,
              // but typically bottom nav items can have different heights or occupy fixed height.
              // Let's add a spacer to keep alignment stable if desired.
              const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
