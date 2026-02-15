import 'package:flutter/material.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_container.dart';
import 'package:sehty/features/monitor/presentation/widgets/family_request_card.dart';

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
                context.l10n.pendingRequests,
                style: AppStyles.styleBold16(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const FamilyRequestCard(),
        ],
      ),
    );
  }
}
