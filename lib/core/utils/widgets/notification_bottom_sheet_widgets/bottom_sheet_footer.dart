import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';

class BottomSheetFooter extends StatelessWidget {
  const BottomSheetFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          context.l10n.markAllAsRead,
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
