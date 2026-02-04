import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';

class ChronicDiseasesSection extends StatefulWidget {
  const ChronicDiseasesSection({super.key});

  @override
  State<ChronicDiseasesSection> createState() => _ChronicDiseasesSectionState();
}

class _ChronicDiseasesSectionState extends State<ChronicDiseasesSection> {
  // Using map for simple local state management of checkboxes
  final Map<String, bool> _diseases = {
    'diabetes': false,
    'blood_pressure': false,
    'heart': false,
    'kidney': false,
    'liver': false,
    'asthma': false,
    'arthritis': false,
    'thyroid': false,
  };

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppStrings.chronicDiseases, // "Chronic Diseases"
                style: AppStyles.styleBold16(context),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.favorite_border,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildCheckboxItem(
                      context,
                      AppStrings.bloodPressure,
                      'blood_pressure',
                    ),
                    const SizedBox(height: 12),
                    _buildCheckboxItem(context, AppStrings.kidney, 'kidney'),
                    const SizedBox(height: 12),
                    _buildCheckboxItem(context, AppStrings.asthma, 'asthma'),
                    const SizedBox(height: 12),
                    _buildCheckboxItem(
                      context,
                      AppStrings.thyroid,
                      'thyroid',
                    ), // Using Thyroid or similar
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    _buildCheckboxItem(
                      context,
                      AppStrings.diabetes,
                      'diabetes',
                    ),
                    const SizedBox(height: 12),
                    _buildCheckboxItem(context, AppStrings.heart, 'heart'),
                    const SizedBox(height: 12),
                    _buildCheckboxItem(context, AppStrings.liver, 'liver'),
                    const SizedBox(height: 12),
                    _buildCheckboxItem(
                      context,
                      AppStrings.arthritis,
                      'arthritis',
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

  Widget _buildCheckboxItem(BuildContext context, String label, String key) {
    // Determine the label based on key if AppStrings doesn't have it directly mapped in the example,
    // but assuming AppStrings passed are correct.

    // Hardcoding some fallbacks if AppStrings are generic, but relying on passed label.

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(label, style: AppStyles.styleMedium14(context)),
        const SizedBox(width: 8),
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _diseases[key] ?? false,
            onChanged: (val) {
              setState(() {
                _diseases[key] = val!;
              });
            },
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
