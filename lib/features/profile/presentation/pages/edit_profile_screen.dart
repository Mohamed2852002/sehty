import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/auth/presentation/widgets/custom_title_and_drop_down_menu.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/chronic_diseases_list.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/patient_code_card.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/privacy_footer_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Custom App Bar
              SliverAppBar(
                surfaceTintColor: Colors.transparent,
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                title: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      context.l10n.profile,
                      style: AppStyles.styleBold26(
                        context,
                      ).copyWith(color: Colors.black),
                    ),
                    Text(
                      context.l10n.personalMedicalInfo,
                      maxLines: 2,
                      style: AppStyles.styleRegular16(
                        context,
                      ).copyWith(color: AppColors.darkColor),
                    ),
                  ],
                ),
                actions: [
                  CustomButton(
                    onTap: () => context.pop(),
                    color: AppColors.darkColor,
                    borderRadius: 8,
                    content: Text(
                      context.l10n.cancel,
                      style: AppStyles.styleBold12(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Center(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16),
                      child: CustomButton(
                        onTap: () => context.pop(),
                        color: AppColors.greenColor,
                        borderRadius: 8,
                        content: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.save,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              context.l10n.save,
                              style: AppStyles.styleBold12(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Content
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 24),
                  const PatientCodeCard(),
                  const SizedBox(height: 24),
                  // Basic Information Section
                  CustomContainer(
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            IconContainer(
                              child: SvgPicture.asset(
                                AppAssets.iconsProfilePersonIcon,
                              ),
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
                          hint: 'علي عبدالعزيز', // Example name
                        ),

                        CustomTitleAndTextFormField(
                          label: context.l10n.age,
                          hint: '70',
                        ),

                        CustomTitleAndDropDownMenu(
                          label: context.l10n.gender,
                          // value: context.l10n.male,
                        ),

                        CustomTitleAndTextFormField(
                          label: context.l10n.weightKg,
                          hint: '69',
                        ),

                        CustomTitleAndTextFormField(
                          label: context.l10n.phoneNumber,
                          hint: '0121551112',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Address Section
                  CustomContainer(
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            IconContainer(
                              child: SvgPicture.asset(
                                AppAssets.iconsProfileAddressIcon,
                              ),
                            ),
                            Text(
                              context.l10n.address,
                              style: AppStyles.styleBold16(
                                context,
                              ).copyWith(color: AppColors.heavyBlueColor),
                            ),
                          ],
                        ),
                        CustomTitleAndDropDownMenu(
                          label: context.l10n.governorate,
                          // value: 'القاهرة',
                        ),
                        CustomTitleAndTextFormField(
                          label: context.l10n.district,
                          hint: 'مدينة نصر',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Chronic Diseases Section
                  const ChronicDiseasesList(),
                  const SizedBox(height: 24),

                  // Privacy Footer
                  const PrivacyFooterWidget(),
                  const SizedBox(height: 24),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
