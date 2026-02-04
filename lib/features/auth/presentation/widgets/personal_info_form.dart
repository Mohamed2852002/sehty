import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppStrings.personalInfo, // "Personal Information"
                style: AppStyles.styleBold16(context),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.person_outline,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),

          _buildLabel(context, AppStrings.fullName), // "Full Name"
          const SizedBox(height: 8),
          _buildTextField(
            context,
            'علي عبد العزيز',
          ), // "Ali Abdulaziz" (Placeholder)
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildLabel(context, AppStrings.age), // "Age"
                    const SizedBox(height: 8),
                    _buildDropdown(context, '70'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildLabel(
                      context,
                      '${AppStrings.weight} (${AppStrings.kg})',
                    ), // "Weight (kg)"
                    const SizedBox(height: 8),
                    _buildDropdown(context, '70'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildLabel(context, AppStrings.gender), // "Gender"
                    const SizedBox(height: 8),
                    _buildDropdown(context, AppStrings.male), // "Male"
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildLabel(context, AppStrings.district), // "District"
                    const SizedBox(height: 8),
                    _buildDropdown(
                      context,
                      AppStrings.address,
                    ), // "Nasr City" (using address placeholder/string for now if specific not avail)
                    // Or specific string: 'مدينة نصر'
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildLabel(
                      context,
                      AppStrings.governorate,
                    ), // "Governorate"
                    const SizedBox(height: 8),
                    _buildDropdown(context, 'القاهرة'), // "Cairo"
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String label) {
    return Text(
      label,
      style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
    );
  }

  Widget _buildTextField(BuildContext context, String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppStyles.styleRegular14(context),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
          Text(value, style: AppStyles.styleRegular14(context)),
        ],
      ),
    );
  }
}
