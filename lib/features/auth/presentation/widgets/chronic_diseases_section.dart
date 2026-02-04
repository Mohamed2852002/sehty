import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/auth/presentation/widgets/check_box_item.dart';

class ChronicDiseasesSection extends StatefulWidget {
  const ChronicDiseasesSection({super.key});

  @override
  State<ChronicDiseasesSection> createState() => _ChronicDiseasesSectionState();
}

class _ChronicDiseasesSectionState extends State<ChronicDiseasesSection> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(AppAssets.iconsRegisterHeartIcon),
              Text(
                AppStrings.chronicDiseases,
                style: AppStyles.styleBold16(context),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    CheckBoxItem(
                      label: AppStrings.bloodPressure,
                      diseaseKey: 'blood_pressure',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: AppStrings.kidney,
                      diseaseKey: 'kidney',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: AppStrings.asthma,
                      diseaseKey: 'asthma',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: AppStrings.thyroid,
                      diseaseKey: 'thyroid',
                    ), // Using Thyroid or similar
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    CheckBoxItem(
                      label: AppStrings.diabetes,
                      diseaseKey: 'diabetes',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(label: AppStrings.heart, diseaseKey: 'heart'),
                    const SizedBox(height: 12),
                    CheckBoxItem(label: AppStrings.liver, diseaseKey: 'liver'),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: AppStrings.arthritis,
                      diseaseKey: 'arthritis',
                    ), // Using Arthritis or similar
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
