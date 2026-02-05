import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';

class UnreadDotWidget extends StatelessWidget {
  final bool isUnread;

  const UnreadDotWidget({super.key, required this.isUnread});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isUnread ? AppColors.primary : Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
