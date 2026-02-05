import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class PrivacyFooterWidget extends StatelessWidget {
  const PrivacyFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffF0FDF4), Color(0xffDCFCE7)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffB9F8CF)),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.lock_outline,
                size: 16,
                color: Color(0xff2E7D32),
              ),
              const SizedBox(width: 8),
              Text(
                context.l10n.privacyImportant,
                style: AppStyles.styleBold12(
                  context,
                ).copyWith(color: const Color(0xff2E7D32)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.privacyNote,
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: const Color(0xff2E7D32), height: 1.5),
          ),
        ],
      ),
    );
  }
}
