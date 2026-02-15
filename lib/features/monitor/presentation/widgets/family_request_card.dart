
import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';

class FamilyRequestCard extends StatelessWidget {
  const FamilyRequestCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffFFFDE7), // Very Light Yellow
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffFFF176).withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أخي - عبدالله',
                  style: AppStyles.styleBold14(context),
                ),
                const SizedBox(height: 4),
                Text(
                  '0509876543',
                  style: AppStyles.styleRegular12(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffFDD835),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              context.l10n.waitingAcceptance,
              style: AppStyles.styleMedium12(
                context,
              ).copyWith(color: AppColors.darkColor),
            ),
          ),
        ],
      ),
    );
  }
}
