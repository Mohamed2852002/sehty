import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';

class FamilyFollowUpWidget extends StatelessWidget {
  const FamilyFollowUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsHomeFamilyIcon),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  AppStrings.familyTracking, // Or appropriate string
                  style: AppStyles.styleBold20(context),
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        AppStrings.add,
                        style: AppStyles.styleRegular14(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            AppStrings.noFamilyFollower,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular16(
              context,
            ).copyWith(color: AppColors.darkColor),
          ),
          const SizedBox(height: 4),
          Text(
            AppStrings.addFamilyMember,
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
