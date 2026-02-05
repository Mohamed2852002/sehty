import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';

import 'package:sehty/core/utils/app_styles.dart';

class DataConsentWidget extends StatefulWidget {
  const DataConsentWidget({super.key});

  @override
  State<DataConsentWidget> createState() => _DataConsentWidgetState();
}

class _DataConsentWidgetState extends State<DataConsentWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.primaryDark.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _isChecked,
                onChanged: (val) {
                  setState(() {
                    _isChecked = val!;
                  });
                },
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset(AppAssets.iconsRegisterDoneIcon),
                    Text(
                      context.l10n.dataConsentTitle,
                      style: AppStyles.styleBold14(
                        context,
                      ).copyWith(color: AppColors.darkColor),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.dataConsentDescription,
                  style: AppStyles.styleRegular12(
                    context,
                  ).copyWith(color: Colors.grey[700], height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
