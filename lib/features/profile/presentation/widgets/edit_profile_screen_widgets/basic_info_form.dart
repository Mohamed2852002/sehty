import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_drop_down_menu.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';

class BasicInfoForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final String? initialGender;
  final TextEditingController weightController;
  final TextEditingController phoneController;
  final Function(String?) onGenderChanged;

  const BasicInfoForm({
    super.key,
    required this.nameController,
    required this.ageController,
    this.initialGender,
    required this.weightController,
    required this.phoneController,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsProfilePersonIcon),
              ),
              Text(
                context.l10n.basicInfo,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.heavyBlueColor),
              ),
            ],
          ),
          CustomTitleAndTextFormField(
            label: context.l10n.fullName,
            hint: '',
            controller: nameController,
          ),
          CustomTitleAndTextFormField(
            label: context.l10n.age,
            hint: '',
            keyboardType: TextInputType.number,
            controller: ageController,
          ),
          CustomTitleAndDropDownMenu(
            label: context.l10n.gender,
            value: (initialGender?.isNotEmpty ?? false) ? initialGender : null,
            items: [context.l10n.male, context.l10n.female],
            onChanged: onGenderChanged,
          ),
          CustomTitleAndTextFormField(
            label: context.l10n.weightKg,
            hint: '',
            keyboardType: TextInputType.number,
            controller: weightController,
          ),
          CustomTitleAndTextFormField(
            label: context.l10n.phoneNumber,
            hint: '',
            keyboardType: TextInputType.phone,
            controller: phoneController,
          ),
        ],
      ),
    );
  }
}
