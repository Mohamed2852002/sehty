import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';

class LanguageSwitcherWidget extends StatelessWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.language, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                context.l10n.language,
                style: AppStyles.styleBold16(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: _LanguageOption(
                      label: context.l10n.arabic,
                      isSelected: state.locale == 'ar',
                      onTap: () {
                        context.read<ProfileBloc>().add(
                          const ChangeLanguageEvent('ar'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _LanguageOption(
                      label: context.l10n.english,
                      isSelected: state.locale == 'en',
                      onTap: () {
                        context.read<ProfileBloc>().add(
                          const ChangeLanguageEvent('en'),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.grey.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AppStyles.styleSemiBold14(
              context,
            ).copyWith(color: isSelected ? AppColors.primary : Colors.black87),
          ),
        ),
      ),
    );
  }
}
