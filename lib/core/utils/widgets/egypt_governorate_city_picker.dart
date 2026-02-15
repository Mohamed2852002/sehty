import 'package:flutter/material.dart';
import 'package:sehty/core/data/egypt_governorates.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_drop_down_menu.dart';

class EgyptGovernorateCityPicker extends StatefulWidget {
  final String? initialGovernorate;
  final String? initialCity;
  final void Function(String?) onGovernorateChanged;
  final void Function(String?) onCityChanged;

  const EgyptGovernorateCityPicker({
    super.key,
    this.initialGovernorate,
    this.initialCity,
    required this.onGovernorateChanged,
    required this.onCityChanged,
  });

  @override
  State<EgyptGovernorateCityPicker> createState() =>
      _EgyptGovernorateCityPickerState();
}

class _EgyptGovernorateCityPickerState
    extends State<EgyptGovernorateCityPicker> {
  String? _selectedGovernorateId;
  String? _selectedCityId;

  @override
  void initState() {
    super.initState();
    _resolveInitialValues();
  }

  void _resolveInitialValues() {
    if (widget.initialGovernorate != null) {
      final gov = EgyptGovernorates.governorates.firstWhere(
        (g) =>
            g['governorate_name_ar'] == widget.initialGovernorate ||
            g['governorate_name_en'] == widget.initialGovernorate,
        orElse: () => {},
      );
      if (gov.isNotEmpty) {
        _selectedGovernorateId = gov['id'];
        if (widget.initialCity != null) {
          final city = EgyptGovernorates.cities.firstWhere(
            (c) =>
                c['governorate_id'] == _selectedGovernorateId &&
                (c['city_name_ar'] == widget.initialCity ||
                    c['city_name_en'] == widget.initialCity),
            orElse: () => {},
          );
          if (city.isNotEmpty) {
            _selectedCityId = city['id'];
          }
        }
      }
    }
  }

  List<Map<String, dynamic>> get _citiesForSelectedGov {
    if (_selectedGovernorateId == null) return [];
    return EgyptGovernorates.cities
        .where((city) => city['governorate_id'] == _selectedGovernorateId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final governorateItems = EgyptGovernorates.governorates.map((gov) {
      return isArabic
          ? gov['governorate_name_ar'] as String
          : gov['governorate_name_en'] as String;
    }).toList();

    final cityItems = _citiesForSelectedGov.map((city) {
      return isArabic
          ? city['city_name_ar'] as String
          : city['city_name_en'] as String;
    }).toList();

    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: CustomTitleAndDropDownMenu(
            label: context.l10n.governorate,
            value: _selectedGovernorateId != null
                ? (isArabic
                      ? EgyptGovernorates.governorates.firstWhere(
                          (g) => g['id'] == _selectedGovernorateId,
                        )['governorate_name_ar']
                      : EgyptGovernorates.governorates.firstWhere(
                          (g) => g['id'] == _selectedGovernorateId,
                        )['governorate_name_en'])
                : null,
            items: governorateItems,
            onChanged: (val) {
              if (val == null) return;
              final selectedGov = EgyptGovernorates.governorates.firstWhere(
                (g) =>
                    (isArabic
                        ? g['governorate_name_ar']
                        : g['governorate_name_en']) ==
                    val,
              );
              setState(() {
                _selectedGovernorateId = selectedGov['id'];
                _selectedCityId = null;
              });
              widget.onGovernorateChanged(val);
              widget.onCityChanged(null);
            },
          ),
        ),
        Expanded(
          child: CustomTitleAndDropDownMenu(
            label: context.l10n.district,
            value: _selectedCityId != null
                ? (isArabic
                      ? EgyptGovernorates.cities.firstWhere(
                          (c) => c['id'] == _selectedCityId,
                        )['city_name_ar']
                      : EgyptGovernorates.cities.firstWhere(
                          (c) => c['id'] == _selectedCityId,
                        )['city_name_en'])
                : null,
            items: cityItems,
            onChanged: (val) {
              if (val == null) {
                setState(() => _selectedCityId = null);
                widget.onCityChanged(null);
                return;
              }
              final selectedCity = EgyptGovernorates.cities.firstWhere(
                (c) =>
                    (isArabic ? c['city_name_ar'] : c['city_name_en']) == val &&
                    c['governorate_id'] == _selectedGovernorateId,
              );
              setState(() {
                _selectedCityId = selectedCity['id'];
              });
              widget.onCityChanged(val);
            },
          ),
        ),
      ],
    );
  }
}
