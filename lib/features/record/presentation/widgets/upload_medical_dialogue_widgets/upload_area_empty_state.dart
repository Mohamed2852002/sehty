import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';

class UploadAreaEmptyState extends StatelessWidget {
  const UploadAreaEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
