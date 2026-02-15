import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/record/presentation/widgets/upload_medical_dialogue_widgets/upload_area_empty_state.dart';
import 'package:sehty/features/record/presentation/widgets/upload_medical_dialogue_widgets/upload_area_selected_file_state.dart';

class UploadAreaWidget extends StatelessWidget {
  const UploadAreaWidget({
    super.key,
    this.onTap,
    this.selectedFileName,
    this.showError = false,
    this.errorMessage,
  });

  final VoidCallback? onTap;
  final String? selectedFileName;
  final bool showError;
  final String? errorMessage;

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
              border: Border.all(
                color: showError
                    ? Colors.red
                    : (selectedFileName != null
                          ? AppColors.primary
                          : Colors.grey.shade300),
              ),
              color: selectedFileName != null
                  ? AppColors.primary.withValues(alpha: 0.05)
                  : null,
            ),
            child: selectedFileName != null
                ? UploadAreaSelectedFileState(
                    selectedFileName: selectedFileName!,
                  )
                : const UploadAreaEmptyState(),
          ),
        ),
        if (showError && errorMessage != null)
          Text(
            errorMessage!,
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: Colors.red),
          ),
      ],
    );
  }
}
