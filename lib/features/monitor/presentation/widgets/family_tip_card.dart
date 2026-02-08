import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class FamilyTipCard extends StatelessWidget {
  const FamilyTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffE3F2FD), // Blue 50
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffBBDEFB)), // Blue 100
      ),
      child: Column(
        spacing: 8,
        children: [
          Row(
            children: [
              Text(
                context.l10n.familyTip, // "Tip:"
                style: AppStyles.styleBold14(
                  context,
                ).copyWith(color: AppColors.primary),
              ),
            ],
          ),
          Text(
            context
                .l10n
                .familyTipNote, // "Connect with your loved ones regularly..."
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: AppColors.primary, height: 1.5),
          ),
        ],
      ),
    );
  }
}
