import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class AddPatientInfoBox extends StatelessWidget {
  const AddPatientInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.transparentPrimary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.transparentDarkPrimary),
      ),
      child: Text(
        context.l10n.addPatientNote,
        style: AppStyles.styleRegular14(
          context,
        ).copyWith(color: Colors.blue.withValues(alpha: 0.7), height: 1.5),
      ),
    );
  }
}
