import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/auth/presentation/widgets/register_screen_widgets/check_box_item.dart';
import 'package:sehty/features/profile/presentation/bloc/profile_bloc.dart';

class ChronicDiseasesSection extends StatefulWidget {
  final ValueChanged<List<int>> onChanged;
  const ChronicDiseasesSection({super.key, required this.onChanged});

  @override
  State<ChronicDiseasesSection> createState() => _ChronicDiseasesSectionState();
}

class _ChronicDiseasesSectionState extends State<ChronicDiseasesSection> {
  final List<int> _selectedIds = [];

  void _onDiseaseChanged(int id, bool value) {
    setState(() {
      if (value) {
        if (!_selectedIds.contains(id)) _selectedIds.add(id);
      } else {
        _selectedIds.remove(id);
      }
    });
    widget.onChanged(_selectedIds);
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(AppAssets.iconsRegisterHeartIcon),
              Text(
                context.l10n.chronicDiseases,
                style: AppStyles.styleBold16(context),
              ),
            ],
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) =>
                current is ChronicDiseasesLoaded || current is ProfileLoading,
            builder: (context, state) {
              if (state is ChronicDiseasesLoaded) {
                final diseases = state.chronicDiseases;
                final isEn =
                    Localizations.localeOf(context).languageCode == 'en';

                // Split diseases into two columns
                final int mid = (diseases.length / 2).ceil();
                final firstCol = diseases.take(mid).toList();
                final secondCol = diseases.skip(mid).toList();

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 12,
                        children: firstCol.map((disease) {
                          final id = disease.id ?? 0;
                          return CheckBoxItem(
                            label: isEn
                                ? (disease.nameEn ?? '')
                                : (disease.nameAr ?? ''),
                            value: _selectedIds.contains(id),
                            onChanged: (v) => _onDiseaseChanged(id, v ?? false),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        spacing: 12,
                        children: secondCol.map((disease) {
                          final id = disease.id ?? 0;
                          return CheckBoxItem(
                            label: isEn
                                ? (disease.nameEn ?? '')
                                : (disease.nameAr ?? ''),
                            value: _selectedIds.contains(id),
                            onChanged: (v) => _onDiseaseChanged(id, v ?? false),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
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
