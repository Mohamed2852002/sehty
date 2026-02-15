import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/custom_text_form_field.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_drop_down_menu.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/widgets/egypt_governorate_city_picker.dart';
import 'package:sehty/features/auth/presentation/widgets/otp_digit_widget.dart';
import 'package:sehty/features/auth/presentation/widgets/register_screen_widgets/send_code_button.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({
    super.key,
    required this.onSavedName,
    required this.onSavedAge,
    required this.onSavedWeight,
    required this.onSavedGender,
    required this.onStateChanged,
    required this.onCityChanged,
    required this.onSavedPhone,
    required this.onSendCodePressed,
    required this.isOtpSent,
    required this.onOtpChanged,
    required this.onOtpBackspace,
    required this.otpFocusNodes,
    required this.otpControllers,
  });

  final Function(String?) onSavedName;
  final Function(String?) onSavedAge;
  final Function(String?) onSavedWeight;
  final Function(String?) onSavedGender;
  final Function(String?) onStateChanged;
  final Function(String?) onCityChanged;
  final Function(String?) onSavedPhone;
  final Function(String) onSendCodePressed;
  final bool isOtpSent;
  final Function(String, int) onOtpChanged;
  final Function(int) onOtpBackspace;
  final List<FocusNode> otpFocusNodes;
  final List<TextEditingController> otpControllers;

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(AppAssets.iconsRegisterSmallProfileIcon),
              Text(
                context.l10n.personalInfo,
                style: AppStyles.styleBold18(context),
              ),
            ],
          ),
          CustomTitleAndTextFormField(
            label: context.l10n.fullName,
            hint: context.l10n.fullName,
            onSaved: widget.onSavedName,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: CustomTitleAndTextFormField(
                  label: context.l10n.age,
                  hint: context.l10n.age,
                  keyboardType: TextInputType.number,
                  onSaved: widget.onSavedAge,
                ),
              ),
              Expanded(
                child: CustomTitleAndTextFormField(
                  label: '${context.l10n.weight} (${context.l10n.kg})',
                  hint: '${context.l10n.weight} (${context.l10n.kg})',
                  keyboardType: TextInputType.number,
                  onSaved: widget.onSavedWeight,
                ),
              ),
              Expanded(
                child: CustomTitleAndDropDownMenu(
                  label: context.l10n.gender,
                  onSaved: widget.onSavedGender,
                  items: [context.l10n.male, context.l10n.female],
                  dropDownIconVisible: false,
                ),
              ),
            ],
          ),
          EgyptGovernorateCityPicker(
            onGovernorateChanged: widget.onStateChanged,
            onCityChanged: widget.onCityChanged,
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.phoneNumber,
                style: AppStyles.styleRegular16(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hint: context.l10n.phoneNumber,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          _phoneNumber = value;
                        },
                        onSaved: widget.onSavedPhone,
                      ),
                    ),
                    Expanded(
                      child: SendCodeButton(
                        onTap: () {
                          if (_phoneNumber.isNotEmpty) {
                            widget.onSendCodePressed(_phoneNumber);
                          } else {
                            AppFunctions.showCustomSnackBar(
                              context,
                              context.l10n.phoneRequired,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isOtpSent) ...[
                const SizedBox(height: 16),
                Text(
                  context.l10n.enterVerificationCode,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
                Row(
                  spacing: 8,
                  children: List.generate(
                    6,
                    (index) => Expanded(
                      child: OtpDigitWidget(
                        index: index,
                        controller: widget.otpControllers[index],
                        focusNode: widget.otpFocusNodes[index],
                        onChanged: (value) => widget.onOtpChanged(value, index),
                        onBackspace: () => widget.onOtpBackspace(index),
                      ),
                    ),
                  ),
                ),
              ] else
                Text(
                  context.l10n.sendVerificationCode,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: Colors.grey),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
