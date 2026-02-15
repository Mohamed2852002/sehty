import 'package:flutter/material.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';

class MonitorStatCard extends StatelessWidget {
  const MonitorStatCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.iconColor,
    required this.icon,
  });

  final String title;
  final String count;
  final Color color;
  final Color iconColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        spacing: 8,
        children: [
          Row(
            spacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 18),
              ),
              Text(
                title,
                style: AppStyles.styleRegular14(
                  context,
                ).copyWith(color: Colors.grey),
              ),
            ],
          ),
          Text(
            count,
            style: AppStyles.styleBold24(context).copyWith(color: iconColor),
          ),
        ],
      ),
    );
  }
}
