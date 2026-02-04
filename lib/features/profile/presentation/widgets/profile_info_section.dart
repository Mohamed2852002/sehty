import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/core/utils/widgets/icon_container.dart';

class ProfileInfoSection extends StatelessWidget {
  final String title;
  final String icon; // Or path if SVG
  final Widget child;

  const ProfileInfoSection({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(title, style: AppStyles.styleBold16(context)),
              const SizedBox(width: 8),
              IconContainer(child: SvgPicture.asset(icon)),
            
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
