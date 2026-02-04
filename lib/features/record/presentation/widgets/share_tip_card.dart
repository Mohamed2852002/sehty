import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';

class ShareTipCard extends StatelessWidget {
  const ShareTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppStrings.shareSecurely, // "How to share your files securely?"
                style: AppStyles.styleBold16(context),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.lightbulb_outline,
                color: Colors.amber,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTipItem(
            context,
            AppStrings.shareSecurelyNote,
          ), // "Click 'Share' to create a secure, temporary link"
          const SizedBox(height: 8),
          _buildTipItem(
            context,
            AppStrings.linkValid24Hours,
          ), // "The link works for 24 hours only"
          const SizedBox(height: 8),
          _buildTipItem(
            context,
            AppStrings.cancelShareAnytime,
          ), // "You can cancel sharing at any time"
        ],
      ),
    );
  }

  Widget _buildTipItem(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: AppColors.darkColor, height: 1.4),
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Container(
            width: 4,
            height: 4,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
