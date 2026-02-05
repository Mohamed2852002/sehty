import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class FamilyEmptyState extends StatelessWidget {
  const FamilyEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.noFamilyFollower,
          textAlign: TextAlign.center,
          style: AppStyles.styleRegular16(
            context,
          ).copyWith(color: AppColors.darkColor),
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.addFamilyMember,
          textAlign: TextAlign.center,
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
