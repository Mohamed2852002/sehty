import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_info_row.dart';
import 'package:sehty/features/profile/presentation/widgets/profile_info_widget.dart';

class AddressInformationSection extends StatelessWidget {
  const AddressInformationSection({super.key, required this.profile});

  final ProfileEntity? profile;

  @override
  Widget build(BuildContext context) {
    return ProfileInfoWidget(
      title: context.l10n.address,
      icon: AppAssets.iconsProfileAddressIcon,
      child: Column(
        children: [
          ProfileInfoRow(
            label: context.l10n.governorate,
            value: profile?.governorate ?? context.l10n.n_a,
          ),
          ProfileInfoRow(
            label: context.l10n.district,
            value: profile?.district ?? context.l10n.n_a,
            isLast: true,
          ),
        ],
      ),
    );
  }
}
