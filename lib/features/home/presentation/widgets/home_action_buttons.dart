import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/app_assets.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/features/home/presentation/widgets/action_button.dart';
import 'package:sehty/main_shell/cubit/main_shell_cubit.dart';

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: ActionButton(
            onTap: () {
              context.read<MainShellCubit>().changeTab(2);
            },
            title: context.l10n.medicalRecord,
            icon: AppAssets.iconsHomeRecordIcon,
          ),
        ),
        Expanded(
          child: ActionButton(
            onTap: () {
              context.read<MainShellCubit>().changeTab(1);
            },
            title: context.l10n.addMedicine,
            icon: AppAssets.iconsHomeAddIcon,
          ),
        ),
      ],
    );
  }
}
