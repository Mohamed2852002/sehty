import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/features/auth/presentation/widgets/custom_title_and_drop_down_menu.dart';
import 'package:sehty/features/record/presentation/widgets/upload_medical_dialogue_widgets/upload_area_widget.dart';
import 'package:sehty/features/record/presentation/widgets/upload_medical_dialogue_widgets/security_note_widget.dart';

class UploadMedicalRecordDialog extends StatefulWidget {
  const UploadMedicalRecordDialog({super.key});

  @override
  State<UploadMedicalRecordDialog> createState() =>
      _UploadMedicalRecordDialogState();
}

class _UploadMedicalRecordDialogState extends State<UploadMedicalRecordDialog> {
  final TextEditingController _fileNameController = TextEditingController();
  final TextEditingController _labNameController = TextEditingController();

  @override
  void dispose() {
    _fileNameController.dispose();
    _labNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.uploadMedicalFile,
                  style: AppStyles.styleBold20(context),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: AppColors.darkColor),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomTitleAndTextFormField(
            label: context.l10n.fileName,
            hint: context.l10n.fileNameExample,
          ),
          const SizedBox(height: 20),
          CustomTitleAndDropDownMenu(label: context.l10n.category),
          const SizedBox(height: 20),
          CustomTitleAndTextFormField(
            label: context.l10n.labName,
            hint: context.l10n.labNameExample,
          ),
          const SizedBox(height: 20),
          const UploadAreaWidget(),
          const SizedBox(height: 24),
          const SecurityNoteWidget(),
          const SizedBox(height: 32),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomButton(
                  content: Text(
                    context.l10n.uploadFile,
                    style: AppStyles.styleBold16(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle upload
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  content: Text(
                    context.l10n.cancel,
                    style: AppStyles.styleBold16(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                  onTap: () => Navigator.pop(context),
                  color: AppColors.greyButtonColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
