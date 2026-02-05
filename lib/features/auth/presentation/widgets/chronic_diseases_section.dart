import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
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
                context.l10n.chronicDiseases,
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
                      label: context.l10n.bloodPressure,
                      diseaseKey: 'blood_pressure',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: context.l10n.kidney,
                      diseaseKey: 'kidney',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: context.l10n.asthma,
                      diseaseKey: 'asthma',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: context.l10n.thyroid,
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
                      label: context.l10n.diabetes,
                      diseaseKey: 'diabetes',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: context.l10n.heart,
                      diseaseKey: 'heart',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: context.l10n.liver,
                      diseaseKey: 'liver',
                    ),
                    const SizedBox(height: 12),
                    CheckBoxItem(
                      label: context.l10n.arthritis,
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
