import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/home/presentation/widgets/family_member_dialog.dart';

class FamilyFollowUpWidget extends StatefulWidget {
  const FamilyFollowUpWidget({super.key});

  @override
  State<FamilyFollowUpWidget> createState() => _FamilyFollowUpWidgetState();
}

class _FamilyFollowUpWidgetState extends State<FamilyFollowUpWidget> {
  // Mock data to match the UI in the image
  final List<Map<String, dynamic>> _familyMembers = [
    {
      'name': 'أب', // Father
      'phone': '1111',
      'status': 'waiting', // waiting, accepted
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              // Add button on the left (End in RTL)
              // Wait, in RTL: Start is Right, End is Left.
              // To have Add button on Left and Title/Icon on Right:
              // Row(children: [Icon, Title, Spacer, AddButton])

              // Icon on the Right
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsHomeFamilyIcon),
              ),
              const SizedBox(width: 12),
              // Title
              Text(
                context.l10n.familyTracking,
                style: AppStyles.styleBold20(context),
              ),
              const Spacer(),
              // Add Button
              InkWell(
                onTap: _showAddDialog,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff26C6DA), // Cyan/Teal from image
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        context.l10n.add,
                        style: AppStyles.styleBold14(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (_familyMembers.isEmpty)
            _buildEmptyState(context)
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _familyMembers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final member = _familyMembers[index];
                return _buildFamilyMemberItem(context, member);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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

  Widget _buildFamilyMemberItem(
    BuildContext context,
    Map<String, dynamic> member,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF8F9FA), // Very light grey bg
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Acceptance Status (Left side -> End in RTL)
          // Text(member['name']) // Right side -> Start in RTL

          // Wait, Row in RTL: Start (Right) -> End (Left)
          // Image shows: Name on Right, Status pill on Left.

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

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => const FamilyMemberDialog(),
    );
  }
}
