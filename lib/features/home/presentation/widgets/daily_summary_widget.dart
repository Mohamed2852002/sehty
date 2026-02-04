import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/home/presentation/widgets/medication_list.dart';

class DailySummaryWidget extends StatelessWidget {
  const DailySummaryWidget({super.key});

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
                child: SvgPicture.asset(AppAssets.iconsHomeMedicationIcon),
              ),
              Expanded(
                child: Text(
                  AppStrings.todaySummary,
                  style: AppStyles.styleBold20(context),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.05),
                  AppColors.primary.withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: .end,
              spacing: 4,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.iconsHomeWarningIcon),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          AppStrings
                              .medicationsNotTaken, // "There are medicines not taken"
                          style: AppStyles.styleRegular16(
                            context,
                          ).copyWith(color: Colors.red),
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.topCenter,
                        child: Text(
                          AppStrings.complianceStatus, // "Commitment status"
                          style: AppStyles.styleRegular14(
                            context,
                          ).copyWith(color: AppColors.darkColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      '3', // Hardcoded for now
                      style: AppStyles.styleBold24(context),
                    ),
                    Text(
                      '/',
                      style: AppStyles.styleRegular24(
                        context,
                      ).copyWith(color: Colors.grey),
                    ),
                    Text(
                      '2', // Hardcoded
                      style: AppStyles.styleBold24(context),
                    ),
                  ],
                ),
                Text(
                  AppStrings.medicineForToday,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
              ],
            ),
          ),
          const MedicationList(),
        ],
      ),
    );
  }
}
