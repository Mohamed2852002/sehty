import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';

import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.profile, // "Personal Profile"
                style: AppStyles.styleBold24(context),
              ),
              const SizedBox(height: 4),
              Text(
                context
                    .l10n
                    .personalMedicalInfo, // "Your personal and medical information"
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            context.push(Routes.editProfile);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xff27BED7), // Default primary color
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.edit_outlined, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  context.l10n.edit,
                  style: AppStyles.styleMedium14(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
