import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class RecordEmptyState extends StatelessWidget {
  final String message;
  final IconData icon;

  const RecordEmptyState({
    super.key,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xffE0F7FA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: AppColors.primary, size: 48),
            ),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.styleBold16(
                context,
              ).copyWith(color: AppColors.darkColor),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.addRecordsHint,
              textAlign: TextAlign.center,
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
