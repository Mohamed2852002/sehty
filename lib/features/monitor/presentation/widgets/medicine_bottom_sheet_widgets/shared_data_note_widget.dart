import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class SharedDataNoteWidget extends StatelessWidget {
  const SharedDataNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Text(
        context.l10n.sharedDataNote,
        textAlign: TextAlign.center,
        style: AppStyles.styleRegular14(context).copyWith(
          color: AppColors.darkColor.withValues(alpha: 0.8),
          height: 1.5,
        ),
      ),
    );
  }
}
