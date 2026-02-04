import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class FamilyMemberDialog extends StatelessWidget {
  const FamilyMemberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.grey),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                Text(
                  AppStrings.addFamilyFollower,
                  style: AppStyles.styleBold18(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffEFF6FF), // Light Blue
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                AppStrings.addFamilyFollowerNote,
                textAlign: TextAlign.center,
                style: AppStyles.styleRegular12(
                  context,
                ).copyWith(color: AppColors.primary, height: 1.5),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.relationType,
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: const InputDecoration(border: InputBorder.none),
                style: AppStyles.styleRegular14(context),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.phoneNumber,
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '05XXXXXXXX',
                  hintStyle: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: Colors.grey[400]),
                  border: InputBorder.none,
                ),
                style: AppStyles.styleRegular14(context),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                AppStrings.invitationNote,
                textAlign: TextAlign.center,
                style: AppStyles.styleRegular12(
                  context,
                ).copyWith(color: Colors.grey[600], height: 1.5),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle send invitation
                      Navigator.pop(context, true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff26C6DA),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      AppStrings.sendInvitation,
                      style: AppStyles.styleBold14(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      AppStrings.cancel,
                      style: AppStyles.styleBold14(
                        context,
                      ).copyWith(color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
