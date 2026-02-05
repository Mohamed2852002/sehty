import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';

class MedicalRecordCard extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final IconData icon; // In real app, might be SVG path

  const MedicalRecordCard({
    super.key,
    required this.title,
    required this.date,
    required this.type,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppStyles.styleBold16(context)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE0F7FA),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        type,
                        style: AppStyles.styleRegular12(
                          context,
                        ).copyWith(color: AppColors.primary),
                      ),
                    ),
                    Text(
                      date,
                      style: AppStyles.styleRegular12(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffE0F7FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primary, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey.withValues(alpha: 0.1), height: 0),
          const SizedBox(height: 8),
          // Actions
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomButton(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.share_outlined,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.share, // "Share"
                        style: AppStyles.styleMedium14(
                          context,
                        ).copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                  color: const Color(0xffE0F7FA),
                  onTap: () {},
                ),
              ),
              Expanded(
                child: CustomButton(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.download, color: AppColors.darkColor),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.download, // "Download"
                        style: AppStyles.styleMedium14(
                          context,
                        ).copyWith(color: AppColors.darkColor),
                      ),
                    ],
                  ),
                  color: AppColors.greyButtonColor,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
