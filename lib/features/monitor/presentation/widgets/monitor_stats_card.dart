import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';

class MonitorStatsCard extends StatelessWidget {
  const MonitorStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            title: AppStrings.pending,
            count: '1',
            color: const Color(0xffFFF8E1), // Light Yellow
            iconColor: const Color(0xffF9A825),
            icon: Icons.person_add_alt_1_outlined,
          ),
        ),
        Expanded(
          child: _buildStatCard(
            context,
            title: AppStrings.connected,
            count: '2',
            color: const Color(0xffE6F9EA), // Light Green
            iconColor: AppColors.greenColor,
            icon: Icons.people_outline,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String count,
    required Color color,
    required Color iconColor,
    required IconData icon,
  }) {
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
