import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_dialogue_widgets/add_patient_info_box.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_dialogue_widgets/add_patient_warning_box.dart';

class AddPatientDialog extends StatelessWidget {
  const AddPatientDialog({super.key});

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
                  context.l10n.addPatientForTracking,
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
          const AddPatientInfoBox(),
          const SizedBox(height: 24),
          CustomTitleAndTextFormField(
            label: context.l10n.patientNameLabel,
            hint: context.l10n.fatherExample,
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.personalUseNote,
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: AppColors.darkColor),
          ),
          const SizedBox(height: 20),
          CustomTitleAndTextFormField(
            label: context.l10n.patientPhoneNumber,
            hint: '05XXXXXXXX',
          ),
          const SizedBox(height: 20),
          CustomTitleAndTextFormField(
            label: context.l10n.relationOptional,
            hint: context.l10n.relationExample,
          ),
          const SizedBox(height: 20),
          const AddPatientWarningBox(),
          const SizedBox(height: 20),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomButton(
                  content: Row(
                    spacing: 4,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            context.l10n.sendRequest,
                            style: AppStyles.styleBold16(
                              context,
                            ).copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.person_add_alt_1_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle send request
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  color: AppColors.greyButtonColor,
                  content: Text(
                    context.l10n.cancel,
                    style: AppStyles.styleBold16(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                  onTap: () {
                    // Handle cancel
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
