import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';

class UploadAreaSelectedFileState extends StatelessWidget {
  const UploadAreaSelectedFileState({
    super.key,
    required this.selectedFileName,
  });

  final String selectedFileName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.insert_drive_file_outlined,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            selectedFileName,
            style: AppStyles.styleMedium14(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
      ],
    );
  }
}
