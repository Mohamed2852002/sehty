import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';

class TodayMedicineCount extends StatelessWidget {
  const TodayMedicineCount({
    super.key,
    required this.total,
    required this.taken,
  });

  final int total;
  final int taken;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 4,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.iconsHomeWarningIcon),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    context.l10n.medicationsNotTaken,
                    style: AppStyles.styleRegular16(
                      context,
                    ).copyWith(color: Colors.red),
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.topCenter,
                  child: Text(
                    context.l10n.complianceStatus,
                    style: AppStyles.styleRegular14(
                      context,
                    ).copyWith(color: AppColors.darkColor),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(total.toString(), style: AppStyles.styleBold24(context)),
              Text(
                '/',
                style: AppStyles.styleRegular24(
                  context,
                ).copyWith(color: Colors.grey),
              ),
              Text(taken.toString(), style: AppStyles.styleBold24(context)),
            ],
          ),
          Text(
            context.l10n.medicineForToday,
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: AppColors.darkColor),
          ),
        ],
      ),
    );
  }
}
