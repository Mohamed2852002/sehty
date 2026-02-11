import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';

class CustomDropDownMenu extends StatelessWidget {
  const  CustomDropDownMenu({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
    this.onSaved,
    this.dropDownIconVisible = true,});
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  final Function(String?)? onSaved;
  final String? hint;
  final bool dropDownIconVisible;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: (filter, loadProps) => items
          .where((i) => i.toLowerCase().contains(filter.toLowerCase()))
          .toList(),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.enter_a_value;
        }
        return null;
      },
      selectedItem: value,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      suffixProps:  DropdownSuffixProps(
        dropdownButtonProps: DropdownButtonProps(
          isVisible: dropDownIconVisible,
          iconOpened: const Icon(Icons.keyboard_arrow_up, color: AppColors.primary),
          iconClosed: const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
        ),
      ),
      popupProps: PopupProps.menu(
        fit: FlexFit.loose,
        showSearchBox: items.length > 5,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            hintText: 'Search...',
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        menuProps: MenuProps(
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          elevation: 4,
        ),
        itemBuilder: (context, item, isSelected, isHovered) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              item,
              style: AppStyles.styleRegular14(context).copyWith(
                color: isSelected ? AppColors.primary : AppColors.darkColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
      decoratorProps: DropDownDecoratorProps(
        baseStyle: AppStyles.styleRegular14(context),
        decoration: InputDecoration(
          hintMaxLines: 1,
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          hintText: hint,
          hintStyle: AppStyles.styleRegular14(context),
        ),
      ),
    );
  }
}
