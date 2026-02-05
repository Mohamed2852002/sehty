import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class FamilyMemberItem extends StatelessWidget {
  final Map<String, dynamic> member;

  const FamilyMemberItem({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF8F9FA), // Very light grey bg
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Name and Phone
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member['name'],
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
              const SizedBox(height: 4),
              Text(
                member['phone'],
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),

          // Status Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xffFFF9C4), // Light Yellow
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              context.l10n.waitingAcceptance,
              style: AppStyles.styleMedium12(
                context,
              ).copyWith(color: const Color(0xffFBC02D)), // Darker Yellow text
            ),
          ),
        ],
      ),
    );
  }
}
