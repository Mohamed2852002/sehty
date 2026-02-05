import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';

class FamilyMemberDialog extends StatelessWidget {
  const FamilyMemberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.addFamilyFollower,
                  style: AppStyles.styleBold18(context),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.grey),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffEFF6FF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffBEDBFF)),
            ),
            child: Text(
              context.l10n.addFamilyFollowerNote,
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: AppColors.heavyBlueColor, height: 1.5),
            ),
          ),
          const SizedBox(height: 24),
          CustomTitleAndTextFormField(
            label: context.l10n.relationType,
            hint: context.l10n.relationType,
          ),
          const SizedBox(height: 20),
          CustomTitleAndTextFormField(
            label: context.l10n.phoneNumber,
            hint: context.l10n.phoneNumber,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              context.l10n.invitationNote,
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: AppColors.darkColor, height: 1.5),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomButton(
                  borderRadius: 16,
                  content: Text(
                    context.l10n.sendInvitation,
                    style: AppStyles.styleBold14(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle send invitation
                    Navigator.pop(context, true);
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  borderRadius: 16,
                  content: Text(
                    context.l10n.cancel,
                    style: AppStyles.styleBold14(
                      context,
                    ).copyWith(color: Colors.grey[700]),
                  ),
                  color: AppColors.greyButtonColor,
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
