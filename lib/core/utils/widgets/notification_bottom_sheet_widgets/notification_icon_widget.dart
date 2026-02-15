import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationIconWidget extends StatelessWidget {
  final IconData? iconData;
  final String? svgAsset;
  final Color iconColor;
  final Color iconBgColor;

  const NotificationIconWidget({
    super.key,
    this.iconData,
    this.svgAsset,
    required this.iconColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: iconBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: svgAsset != null
          ? SvgPicture.asset(
              svgAsset!,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              width: 20,
              height: 20,
            )
          : Icon(iconData, color: iconColor, size: 20),
    );
  }
}
