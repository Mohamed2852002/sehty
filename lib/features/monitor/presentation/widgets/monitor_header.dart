import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';

class MonitorHeader extends StatelessWidget {
  const MonitorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                IconContainer(
                  child: SvgPicture.asset(AppAssets.iconsHomeNotificationBell),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    AppStrings.familyTracking, // "Family Tracking"
                    style: AppStyles.styleBold20(context),
                  ),
                  Text(
                    AppStrings
                        .reassureLovedOnes, // "Reassure on your loved ones..."
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.people_outline, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: AppStrings.searchPatient, // "Search for a patient..."
              hintStyle: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.grey),
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
