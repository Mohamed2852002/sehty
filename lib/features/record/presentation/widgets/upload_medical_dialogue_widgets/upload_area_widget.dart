import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class UploadAreaWidget extends StatelessWidget {
  const UploadAreaWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          context.l10n.file,
          style: AppStyles.styleRegular16(
            context,
          ).copyWith(color: AppColors.darkColor),
        ),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.file_upload_outlined,
                    color: AppColors.primary,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  context.l10n.clickToSelectFile,
                  style: AppStyles.styleBold16(context),
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.orImagePdfNote,
                  style: AppStyles.styleRegular12(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
