import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/features/home/presentation/widgets/notification_bottom_sheet_widgets/notification_icon_widget.dart';
import 'package:sehty/features/home/presentation/widgets/notification_bottom_sheet_widgets/unread_dot_widget.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData? iconData;
  final String? svgAsset;
  final Color iconColor;
  final Color iconBgColor;
  final bool isUnread;
  final bool showButtons;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.iconData,
    this.svgAsset,
    required this.iconColor,
    required this.iconBgColor,
    this.isUnread = false,
    this.showButtons = false,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Color(0xffF3F4F6)),
        ),
      ),
      child: Column(
        spacing: 8,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationIconWidget(
                iconData: iconData,
                svgAsset: svgAsset,
                iconColor: iconColor,
                iconBgColor: iconBgColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppStyles.styleBold16(context)),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: AppColors.darkColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: AppStyles.styleRegular12(
                        context,
                      ).copyWith(color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
              UnreadDotWidget(isUnread: isUnread),
            ],
          ),
          if (showButtons)
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: CustomButton(
                    content: Text(
                      context.l10n.accept,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    content: Text(
                      context.l10n.reject,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.black),
                    ),
                    onTap: () {},
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
