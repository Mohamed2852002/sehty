import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/auth/presentation/widgets/custom_title_and_drop_down_menu.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';

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
                context.l10n.personalInfo, // "Personal Information"
                style: AppStyles.styleBold18(context),
              ),
            ],
          ),
          CustomTitleAndTextFormField(
            label: context.l10n.fullName,
            hint: context.l10n.fullName,
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomTitleAndDropDownMenu(label: context.l10n.age),
              ),
              Expanded(
                child: CustomTitleAndDropDownMenu(
                  label: '${context.l10n.weight} (${context.l10n.kg})',
                ),
              ),
              Expanded(
                child: CustomTitleAndDropDownMenu(label: context.l10n.gender),
              ),
            ],
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomTitleAndDropDownMenu(label: context.l10n.address),
              ),
              Expanded(
                child: CustomTitleAndDropDownMenu(
                  label: context.l10n.governorate,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
