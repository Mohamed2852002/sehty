import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';

class PendingRequestsSection extends StatelessWidget {
  const PendingRequestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xffFFF8E1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Color(0xffF9A825),
                  size: 18,
                ),
              ),
              Text(
                AppStrings.pendingRequests,
                style: AppStyles.styleBold16(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffFFFDE7), // Very Light Yellow
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xffFFF176).withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'أخي - عبدالله', // "My Brother - Abdullah"
                        style: AppStyles.styleBold14(context),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '0509876543',
                        style: AppStyles.styleRegular12(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFDD835),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    AppStrings.waitingAcceptance, // "Waiting Acceptance"
                    style: AppStyles.styleMedium12(
                      context,
                    ).copyWith(color: AppColors.darkColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
