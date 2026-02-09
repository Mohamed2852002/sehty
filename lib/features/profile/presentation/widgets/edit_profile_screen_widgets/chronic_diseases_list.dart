import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/profile/domain/entities/chronic_disease_entity.dart';

class ChronicDiseasesList extends StatefulWidget {
  const ChronicDiseasesList({
    super.key,
    this.initialSelectedDiseases = const [],
    required this.onSelectionChanged,
    required this.diseases,
  });

  final List<int> initialSelectedDiseases;
  final ValueChanged<List<int>> onSelectionChanged;
  final List<ChronicDiseaseEntity> diseases;

  @override
  State<ChronicDiseasesList> createState() => _ChronicDiseasesListState();
}

class _ChronicDiseasesListState extends State<ChronicDiseasesList> {
  late List<int> _selectedIds;

  @override
  void initState() {
    super.initState();
    _selectedIds = List.from(widget.initialSelectedDiseases);
  }

  void _toggleSelection(int id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
      widget.onSelectionChanged(_selectedIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEn = Localizations.localeOf(context).languageCode == 'en';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemCount: widget.diseases.length,
          itemBuilder: (context, index) {
            final disease = widget.diseases[index];
            final id = disease.id ?? 0;
            final name = isEn ? (disease.nameEn ?? '') : (disease.nameAr ?? '');
            final isSelected = _selectedIds.contains(id);

            return InkWell(
              onTap: () => _toggleSelection(id),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : AppColors.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : Colors.grey.withValues(alpha: 0.3),
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: AppStyles.styleMedium14(
                          context,
                        ).copyWith(color: AppColors.darkColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Checkbox(
                      value: isSelected,
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (value) => _toggleSelection(id),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
