import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/router/routes.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/auth/presentation/widgets/register_header.dart'; // Reusing header

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const RegisterHeader(),
              const SizedBox(height: 40),
              Text(
                context.l10n.mobileNumber,
                style: AppStyles.styleBold16(context),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                ),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: '01xxxxxxxxx',
                    border: InputBorder.none,
                  ),
                  style: AppStyles.styleRegular14(context),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  context.push(Routes.otpVerification);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  context.l10n.sendCode,
                  style: AppStyles.styleBold16(
                    context,
                  ).copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  context.push(Routes.register);
                },
                child: Text(
                  context.l10n.noAccount,
                  style: AppStyles.styleBold16(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
