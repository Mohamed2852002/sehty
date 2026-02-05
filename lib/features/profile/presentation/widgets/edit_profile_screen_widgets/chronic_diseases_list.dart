import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';

class ChronicDiseasesList extends StatelessWidget {
  const ChronicDiseasesList({super.key});

  @override
  Widget build(BuildContext context) {
    final diseases = [
      context.l10n.diabetes,
      context.l10n.bloodPressure,
      context.l10n.heart,
      context.l10n.kidney,
      context.l10n.liver,
      context.l10n.asthma,
      context.l10n.arthritis,
      context.l10n.thyroid,
    ];

    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsProfileHeartIcon),
              ),
              Text(
                context.l10n.chronicDiseases,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: diseases.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        diseases[index],
                        style: AppStyles.styleMedium14(
                          context,
                        ).copyWith(color: AppColors.darkColor),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: index == 1, // Example: Blood Pressure selected
                        activeColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        side: BorderSide(
                          color: Colors.grey.withValues(alpha: 0.3),
                          width: 1.5,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
