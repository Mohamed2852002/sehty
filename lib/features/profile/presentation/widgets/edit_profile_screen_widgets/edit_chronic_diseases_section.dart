import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:sehty/features/profile/presentation/widgets/edit_profile_screen_widgets/chronic_diseases_list.dart';

class EditChronicDiseasesSection extends StatelessWidget {
  final List<int> initialSelectedDiseases;
  final ValueChanged<List<int>> onSelectionChanged;

  const EditChronicDiseasesSection({
    super.key,
    required this.initialSelectedDiseases,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              IconContainer(
                child: SvgPicture.asset(AppAssets.iconsProfileHeartIcon),
              ),
              Text(
                context.l10n.chronicDiseases,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) =>
                current is ChronicDiseasesLoaded || current is ProfileLoading,
            builder: (context, state) {
              if (state is ChronicDiseasesLoaded) {
                return ChronicDiseasesList(
                  diseases: state.chronicDiseases,
                  initialSelectedDiseases: initialSelectedDiseases,
                  onSelectionChanged: onSelectionChanged,
                );
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
