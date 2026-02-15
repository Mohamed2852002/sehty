import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/home/domain/entities/home_member_entity.dart';

class FamilyMemberItem extends StatelessWidget {
  final HomeMemberEntity member;

  const FamilyMemberItem({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF8F9FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.name,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
              const SizedBox(height: 4),
              Text(
                member.relationship,
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //   decoration: BoxDecoration(
          //     color: member.status == 'approved'
          //         ? AppColors.greenColor.withValues(alpha: 0.1)
          //         : const Color(0xffFFF9C4),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Text(
          //     member.status == 'approved'
          //         ? context.l10n.connected
          //         : context.l10n.waitingAcceptance,
          //     style: AppStyles.styleMedium12(context).copyWith(
          //       color: member.status == 'approved'
          //           ? AppColors.greenColor
          //           : const Color(0xffFBC02D),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
