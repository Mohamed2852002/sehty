import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';

class CheckBoxItem extends StatefulWidget {
  final String label;
  final String diseaseKey;
  const CheckBoxItem({
    super.key,
    required this.label,
    required this.diseaseKey,
  });

  @override
  State<CheckBoxItem> createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  final Map<String, bool> _diseases = {
    'diabetes': false,
    'blood_pressure': false,
    'heart': false,
    'kidney': false,
    'liver': false,
    'asthma': false,
    'arthritis': false,
    'thyroid': false,
  };
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _diseases[widget.diseaseKey] ?? false,
            onChanged: (val) {
              setState(() {
                _diseases[widget.diseaseKey] = val!;
              });
            },
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(color: AppColors.primary),
          ),
        ),
        Text(widget.label, style: AppStyles.styleMedium14(context)),
      ],
    );
  }
}
