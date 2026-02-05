import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class PatientCodeCard extends StatelessWidget {
  const PatientCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff27BED7),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff27BED7).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.patientCode,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Clipboard.setData(const ClipboardData(text: 'PTJK3DJ9FSD'));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Copied to clipboard')),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'PTJK3DJ9FSD',
                style: AppStyles.styleBold24(
                  context,
                ).copyWith(color: Colors.white, letterSpacing: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.useCodeNote,
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: Colors.white.withValues(alpha: 0.8)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
