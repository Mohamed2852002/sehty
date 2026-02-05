import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/header_container.dart';

class PatientCodeCard extends StatelessWidget {
  const PatientCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SvgPicture.asset(AppAssets.iconsProfileGuardIcon),
              ),
              Text(
                context.l10n.patientCode, // "Patient Code"
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'PTJK3DJ9FSD', // Hardcoded as per image
              textAlign: TextAlign.center,
              style: AppStyles.styleBold24(
                context,
              ).copyWith(color: Colors.white, letterSpacing: 2),
            ),
          ),
          Text(
            context.l10n.useCodeNote, // "Use this code when visiting doctor..."
            textAlign: TextAlign.center,
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: Colors.white.withValues(alpha: 0.8)),
          ),
        ],
      ),
    );
  }
}
