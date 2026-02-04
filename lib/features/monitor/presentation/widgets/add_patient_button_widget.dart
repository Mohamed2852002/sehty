import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/monitor/presentation/widgets/add_patient_dialog.dart';

class AddPatientButtonWidget extends StatelessWidget {
  const AddPatientButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const AddPatientDialog(),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: AppColors.gradientBtnColors),
          borderRadius: BorderRadius.circular(16),
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
