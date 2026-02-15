import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';

class EditProfileAppBar extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onSave;

  const EditProfileAppBar({
    super.key,
    required this.isLoading,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.profile,
            style: AppStyles.styleBold26(context).copyWith(color: Colors.black),
          ),
          Text(
            context.l10n.personalMedicalInfo,
            maxLines: 2,
            style: AppStyles.styleRegular16(
              context,
            ).copyWith(color: AppColors.darkColor),
          ),
        ],
      ),
      actions: [
        CustomButton(
          onTap: () => context.pop(),
          color: AppColors.darkColor,
          borderRadius: 8,
          content: Text(
            context.l10n.cancel,
            style: AppStyles.styleBold12(context).copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(width: 6),
        Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: CustomButton(
              onTap: isLoading ? null : onSave,
              color: AppColors.greenColor,
              borderRadius: 8,
              content: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.save, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          context.l10n.save,
                          style: AppStyles.styleBold12(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
