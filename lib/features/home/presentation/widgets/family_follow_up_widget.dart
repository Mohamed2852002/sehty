import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/home/presentation/widgets/family_member_dialogu_widgets/family_member_dialog.dart';
import 'package:sehty/features/home/presentation/widgets/family_empty_state.dart';
import 'package:sehty/features/home/presentation/widgets/family_member_item.dart';

class FamilyFollowUpWidget extends StatefulWidget {
  const FamilyFollowUpWidget({super.key});

  @override
  State<FamilyFollowUpWidget> createState() => _FamilyFollowUpWidgetState();
}

class _FamilyFollowUpWidgetState extends State<FamilyFollowUpWidget> {
  final List<Map<String, dynamic>> _familyMembers = [
    {'name': 'أب', 'phone': '1111', 'status': 'waiting'},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsHomeFamilyIcon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.l10n.familyTracking,
                  style: AppStyles.styleBold20(context),
                ),
              ),
              CustomButton(
                borderRadius: 20,
                content: Row(
                  spacing: 4,
                  children: [
                    Text(
                      context.l10n.add,
                      style: AppStyles.styleBold14(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    const Icon(Icons.add, color: Colors.white),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const FamilyMemberDialog(),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (_familyMembers.isEmpty)
            const FamilyEmptyState()
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _familyMembers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final member = _familyMembers[index];
                return FamilyMemberItem(member: member);
              },
            ),
        ],
      ),
    );
  }
}
