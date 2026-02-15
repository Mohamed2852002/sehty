import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/auth/presentation/bloc/auth_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<AuthBloc>().add(LogoutEvent());
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondary, width: 1.5),
            borderRadius: BorderRadius.circular(16),
            color: AppColors.secondary.withValues(alpha: 0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout_rounded, color: AppColors.secondary),
              const SizedBox(width: 8),
              Text(
                context.l10n.logout,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
