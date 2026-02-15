import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_dialogue_widgets/add_patient_info_box.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_dialogue_widgets/add_patient_warning_box.dart';

class AddPatientDialog extends StatefulWidget {
  const AddPatientDialog({super.key});

  @override
  State<AddPatientDialog> createState() => _AddPatientDialogState();
}

class _AddPatientDialogState extends State<AddPatientDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _relationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
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
              controller: _nameController,
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
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              label: context.l10n.patientPhoneNumber,
              hint: '05XXXXXXXX',
            ),
            const SizedBox(height: 20),
            CustomTitleAndTextFormField(
              controller: _relationController,
              label: context.l10n.relationOptional,
              hint: context.l10n.relationExample,
            ),
            const SizedBox(height: 20),
            const AddPatientWarningBox(),
            const SizedBox(height: 20),
            BlocConsumer<MonitorBloc, MonitorState>(
              listener: (context, state) {
                if (state is NewMemberAdded) {
                  AppFunctions.showCustomSnackBar(
                    context,
                    'تم إرسال طلب المتابعة بنجاح',
                    backgroundColor: AppColors.greenColor,
                  );
                  context.read<MonitorBloc>().add(GetFamilyConnectionsEvent());
                  Navigator.pop(context);
                } else if (state is NewMemberAddingError) {
                  AppFunctions.showCustomSnackBar(
                    context,
                    state.message,
                    backgroundColor: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                return Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomButton(
                        content: state is NewMemberAddingLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Row(
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
                          if (_formKey.currentState!.validate()) {
                            context.read<MonitorBloc>().add(
                              AddNewMemberEvent(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                relationship: _relationController.text,
                              ),
                            );
                          } else {
                            _autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
