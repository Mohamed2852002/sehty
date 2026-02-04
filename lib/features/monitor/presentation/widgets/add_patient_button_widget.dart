import 'package:flutter/material.dart';

import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class AddPatientButtonWidget extends StatelessWidget {
  const AddPatientButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xff29B6F6), // Light Blue
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff29B6F6).withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.addPatientForTracking, // "Add Patient for Tracking"
              style: AppStyles.styleBold16(
                context,
              ).copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.person_add_alt_1_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
