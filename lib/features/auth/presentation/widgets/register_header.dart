import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';

import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: AppColors.gradientBtnColors),
          ),
          child: SvgPicture.asset(AppAssets.iconsRegisterProfileIcon),
        ),
        const SizedBox(height: 16),
        Text(context.l10n.welcomeTitle, style: AppStyles.styleBold24(context)),
        const SizedBox(height: 8),
        Text(
          context.l10n.registerSubtitle,
          textAlign: TextAlign.center,
          style: AppStyles.styleRegular14(
            context,
          ).copyWith(color: AppColors.darkColor),
        ),
      ],
    );
  }
}
