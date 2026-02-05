import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';

class MedicalQrCodeDialog extends StatelessWidget {
  const MedicalQrCodeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.medicalQrCode,
                  style: AppStyles.styleBold20(context),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.grey),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Main Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.1),
                  AppColors.primary.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  context.l10n.qrCodeNote,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
                const SizedBox(height: 20),

                // QR Code Container
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    children: [
                      // QR Code Placeholder
                      Icon(
                        Icons.qr_code_2,
                        size: 150,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  context.l10n.patientCode,
                  style: AppStyles.styleRegular14(
                    context,
                  ).copyWith(color: AppColors.darkColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'PTLVY4HSXF7',
                  style: AppStyles.styleBold24(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Buttons
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: CustomButton(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.download,
                        style: AppStyles.styleBold16(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.download_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onTap: () {
                    // Download logic
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.share,
                        style: AppStyles.styleBold16(
                          context,
                        ).copyWith(color: AppColors.darkColor),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.share_outlined,
                        size: 20,
                        color: AppColors.darkColor,
                      ),
                    ],
                  ),
                  color: AppColors.greyButtonColor,
                  onTap: () {
                    // Share logic
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Warning Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffFEFCE8), // Light Yellow
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xffFFF085)),
            ),
            child: Text(
              context.l10n.shareCodeWarning,
              style: AppStyles.styleBold12(
                context,
              ).copyWith(color: const Color(0xff894B00)), // Dark Orange/Yellow
            ),
          ),
        ],
      ),
    );
  }
}
