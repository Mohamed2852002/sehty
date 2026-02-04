import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/profile/presentation/widgets/language_switcher_widget.dart';
import 'package:sehty/features/profile/presentation/widgets/patient_code_card.dart';
import 'package:sehty/features/profile/presentation/widgets/privacy_note_widget.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_header.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_info_row.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_info_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileHeader(),
                const PatientCodeCard(),
                const LanguageSwitcherWidget(),
                ProfileInfoSection(
                  title: AppStrings.basicInfo,
                  icon: AppAssets.iconsProfilePersonIcon,
                  child: Column(
                    children: [
                      ProfileInfoRow(
                        label: AppStrings.fullName,
                        value: 'علي عبدالعزيز',
                      ),
                      ProfileInfoRow(label: AppStrings.age, value: '70 سنة'),
                      ProfileInfoRow(label: AppStrings.gender, value: 'ذكر'),
                      ProfileInfoRow(label: AppStrings.weight, value: '69 كجم'),
                      ProfileInfoRow(
                        label: AppStrings.phoneNumber,
                        value: '0121551112',
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                ProfileInfoSection(
                  title: AppStrings.address,
                  icon: AppAssets.iconsProfileAddressIcon,
                  child: Column(
                    children: [
                      ProfileInfoRow(
                        label: AppStrings.governorate,
                        value: 'القاهرة',
                      ),
                      ProfileInfoRow(
                        label: AppStrings.district,
                        value: 'مدينة نصر',
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                ProfileInfoSection(
                  title: AppStrings.chronicDiseases,
                  icon: AppAssets.iconsProfileHeartIcon,
                  child: Container(
                    width: double.infinity,
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE0F7FA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        AppStrings.diabetes,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const PrivacyNoteWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
