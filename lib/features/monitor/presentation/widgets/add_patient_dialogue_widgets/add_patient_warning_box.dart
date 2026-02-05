import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class AddPatientWarningBox extends StatelessWidget {
  const AddPatientWarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.yellow.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.yellow.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.phoneVerifyNote,
              style: AppStyles.styleBold12(
                context,
              ).copyWith(color: Colors.orange.shade700),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange.shade700,
            size: 20,
          ),
        ],
      ),
    );
  }
}
