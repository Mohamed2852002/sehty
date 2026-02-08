import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';

class PhoneVerificationSection extends StatelessWidget {
  const PhoneVerificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            context.l10n.mobileNumber, // "Mobile Number"
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                ),
                child: TextField(
                  textAlign: TextAlign.right, // Center or Right
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: '01124545454',
                    border: InputBorder.none,
                  ),
                  style: AppStyles.styleRegular14(context),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '50ث', // "50s"
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.send_outlined,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            context
                .l10n
                .sendVerificationCode, // "We will send verification code via SMS"
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffEFF6FF), // Light Blue bg
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: Column(
            children: [
              Text(
                'أدخل رمز التحقق المرسل إلى 01122212121', // "Enter code sent to..."
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => _buildOtpDigit(context)),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context
                        .l10n
                        .verificationCodeNote, // "Usually takes a minute"
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.lightbulb_outline,
                    size: 14,
                    color: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOtpDigit(BuildContext context) {
    return Container(
      width: 40,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          style: AppStyles.styleBold16(context),
        ),
      ),
    );
  }
}
