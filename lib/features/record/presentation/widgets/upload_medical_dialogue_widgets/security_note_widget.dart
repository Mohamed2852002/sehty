import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class SecurityNoteWidget extends StatelessWidget {
  const SecurityNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffEFF6FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.1)),
      ),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lock_outline,
            color: Colors.blue.withValues(alpha: 0.5),
            size: 16,
          ),
          Expanded(
            child: Text(
              context.l10n.fileSecurityNote,
              style: AppStyles.styleRegular14(
                context,
              ).copyWith(color: Colors.blue.withValues(alpha: 0.7)),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
