import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/features/home/presentation/widgets/action_button.dart';

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: ActionButton(
            title: AppStrings.medicalRecord,
            icon: AppAssets.iconsHomeRecordIcon,
          ),
        ),
        Expanded(
          child: ActionButton(
            title: AppStrings.addMedicine,
            icon: AppAssets.iconsHomeAddIcon,
          ),
        ),
      ],
    );
  }
}
