import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_info_row.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_info_widget.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key, required this.profile});

  final ProfileEntity? profile;

  @override
  Widget build(BuildContext context) {
    return ProfileInfoWidget(
      title: context.l10n.basicInfo,
      icon: AppAssets.iconsProfilePersonIcon,
      child: Column(
        children: [
          ProfileInfoRow(
            label: context.l10n.fullName,
            value: profile?.name ?? context.l10n.n_a,
          ),
          ProfileInfoRow(
            label: context.l10n.age,
            value:
                '${profile?.age ?? context.l10n.n_a} ${context.l10n.yearsOld}',
          ),
          ProfileInfoRow(
            label: context.l10n.gender,
            value: profile?.gender ?? context.l10n.n_a,
          ),
          ProfileInfoRow(
            label: context.l10n.weight,
            value: '${profile?.weight ?? context.l10n.n_a} ${context.l10n.kg}',
          ),
          ProfileInfoRow(
            label: context.l10n.phoneNumber,
            value: profile?.phone ?? context.l10n.n_a,
            isLast: true,
          ),
        ],
      ),
    );
  }
}
