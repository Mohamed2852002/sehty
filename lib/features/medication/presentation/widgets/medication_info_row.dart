import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehty/core/utils/app_styles.dart';

class MedicationInfoRow extends StatelessWidget {
  const MedicationInfoRow({
    super.key,
    required this.label,
    required this.icon,
    this.value,
    this.child,
  });
  final String label;
  final String icon;
  final String? value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        SvgPicture.asset(icon),
        Text(
          '$label :',
          style: AppStyles.styleRegular14(context).copyWith(color: Colors.grey),
        ),
        if (value != null) Text(label, style: AppStyles.styleMedium14(context)),
        ?child,
      ],
    );
  }
}
