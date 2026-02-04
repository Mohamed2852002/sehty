import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/auth/presentation/widgets/custom_title_and_drop_down_menu.dart';
import 'package:sehty/features/auth/presentation/widgets/custom_title_and_text_form_field.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

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
                AppStrings.personalInfo, // "Personal Information"
                style: AppStyles.styleBold18(context),
              ),
            ],
          ),
          CustomTitleAndTextFormField(label: AppStrings.fullName),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomTitleAndDropDownMenu(label: AppStrings.age),
              ),
              Expanded(
                child: CustomTitleAndDropDownMenu(
                  label: '${AppStrings.weight} (${AppStrings.kg})',
                ),
              ),
              Expanded(
                child: CustomTitleAndDropDownMenu(label: AppStrings.gender),
              ),
            ],
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomTitleAndDropDownMenu(label: AppStrings.address),
              ),
              Expanded(
                child: CustomTitleAndDropDownMenu(
                  label: AppStrings.governorate,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
