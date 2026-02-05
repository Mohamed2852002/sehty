import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';

class MonitorHeader extends StatelessWidget {
  const MonitorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Row(
          spacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.gradientBtnColors,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(AppAssets.iconsMonitorPeopleIcon),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.familyTracking, // "Family Tracking"
                    style: AppStyles.styleBold20(context),
                  ),
                  Text(
                    context
                        .l10n
                        .reassureLovedOnes, // "Reassure on your loved ones..."
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: AppColors.darkColor),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                IconContainer(
                  color: const Color(0xffD9FAFF),
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
          ],
        ),
        CustomContainer(
          child: TextField(
            decoration: InputDecoration(
              hintText: context.l10n.searchPatient, // "Search for a patient..."
              hintStyle: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffE5E7EB)),
              ),
              suffixIcon: SvgPicture.asset(
                AppAssets.iconsMonitorSearchIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
