import 'package:flutter/widgets.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_info_widget.dart';

class ProfileChronicDiseasesSection extends StatelessWidget {
  const ProfileChronicDiseasesSection({super.key, required this.profile});
  final ProfileEntity? profile;
  @override
  Widget build(BuildContext context) {
    return ProfileInfoWidget(
      title: context.l10n.chronicDiseases,
      icon: AppAssets.iconsProfileHeartIcon,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(profile?.chronicDiseases?.length ?? 0, (
            index,
          ) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffE0F7FA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                Localizations.localeOf(context).languageCode == 'en'
                    ? (profile?.chronicDiseases?[index])?.nameEn ??
                          context.l10n.n_a
                    : (profile?.chronicDiseases?[index])?.nameAr ??
                          context.l10n.n_a,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
