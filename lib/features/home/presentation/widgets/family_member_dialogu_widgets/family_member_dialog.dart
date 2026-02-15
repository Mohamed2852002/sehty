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

class FamilyMemberDialog extends StatefulWidget {
  const FamilyMemberDialog({super.key});

  @override
  State<FamilyMemberDialog> createState() => _FamilyMemberDialogState();
}

class _FamilyMemberDialogState extends State<FamilyMemberDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController _relationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _relationController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MonitorBloc, MonitorState>(
      listener: (context, state) {
        if (state is FamilyMemberInvited) {
          AppFunctions.showCustomSnackBar(
            context,
            'تم إرسال الدعوة بنجاح',
            backgroundColor: AppColors.greenColor,
          );
          context.read<MonitorBloc>().add(GetFamilyConnectionsEvent());
          Navigator.pop(context);
        } else if (state is FamilyMemberInviteError) {
          AppFunctions.showCustomSnackBar(
            context,
            state.message,
            backgroundColor: AppColors.secondary,
          );
        }
      },
      builder: (context, state) {
        return CustomDialog(
          child: Form(
            key: _formKey,
            autovalidateMode: _autoValidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.addFamilyFollower,
                        style: AppStyles.styleBold18(context),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.grey),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xffEFF6FF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffBEDBFF)),
                  ),
                  child: Text(
                    context.l10n.addFamilyFollowerNote,
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: AppColors.heavyBlueColor, height: 1.5),
                  ),
                ),
                const SizedBox(height: 24),
                CustomTitleAndTextFormField(
                  label: context.l10n.relationType,
                  hint: context.l10n.relationExample,
                  controller: _relationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.enter_a_value;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTitleAndTextFormField(
                  label: context.l10n.phoneNumber,
                  hint: context.l10n.phoneNumber,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.phoneRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    context.l10n.invitationNote,
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: AppColors.darkColor, height: 1.5),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomButton(
                        borderRadius: 16,
                        content: state is FamilyMemberInviteLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                context.l10n.sendInvitation,
                                style: AppStyles.styleBold14(
                                  context,
                                ).copyWith(color: Colors.white),
                              ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<MonitorBloc>().add(
                              InviteFamilyMemberEvent(
                                phone: _phoneController.text,
                                relationship: _relationController.text,
                              ),
                            );
                          } else {
                            setState(() {
                              _autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        borderRadius: 16,
                        content: Text(
                          context.l10n.cancel,
                          style: AppStyles.styleBold14(
                            context,
                          ).copyWith(color: Colors.grey[700]),
                        ),
                        color: AppColors.greyButtonColor,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
