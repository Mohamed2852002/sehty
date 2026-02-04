import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class AddPatientDialog extends StatefulWidget {
  const AddPatientDialog({super.key});

  @override
  State<AddPatientDialog> createState() => _AddPatientDialogState();
}

class _AddPatientDialogState extends State<AddPatientDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _relationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.darkColor),
                  ),
                  Text(
                    AppStrings.addPatientForTracking,
                    style: AppStyles.styleBold20(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildInfoBox(context),
              const SizedBox(height: 24),
              _buildFieldLabel(context, AppStrings.patientNameLabel),
              const SizedBox(height: 8),
              _buildTextField(
                context,
                controller: _nameController,
                hint: AppStrings.fatherExample,
              ),
              const SizedBox(height: 4),
              Text(
                AppStrings.personalUseNote,
                style: AppStyles.styleRegular12(
                  context,
                ).copyWith(color: AppColors.darkColor),
              ),
              const SizedBox(height: 20),
              _buildFieldLabel(context, AppStrings.patientPhoneNumber),
              const SizedBox(height: 8),
              _buildTextField(
                context,
                controller: _phoneController,
                hint: '05XXXXXXXX',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              _buildFieldLabel(context, AppStrings.relationOptional),
              const SizedBox(height: 8),
              _buildTextField(
                context,
                controller: _relationController,
                hint: AppStrings.relationExample,
              ),
              const SizedBox(height: 24),
              _buildWarningBox(context),
              const SizedBox(height: 32),
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      text: AppStrings.cancel,
                      color: Colors.grey.shade200,
                      textColor: AppColors.darkColor,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      text: AppStrings.sendRequest,
                      color: AppColors.primary,
                      textColor: Colors.white,
                      icon: Icons.person_add_alt_1_outlined,
                      onPressed: () {
                        // Handle send request
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.1)),
      ),
      child: Text(
        AppStrings.addPatientNote,
        style: AppStyles.styleRegular12(
          context,
        ).copyWith(color: Colors.blue.withValues(alpha: 0.7), height: 1.5),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildWarningBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.yellow.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.yellow.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.phoneVerifyNote,
              style: AppStyles.styleBold12(
                context,
              ).copyWith(color: Colors.orange.shade700),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange.shade700,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(BuildContext context, String label) {
    return Text(
      label,
      style: AppStyles.styleBold14(
        context,
      ).copyWith(color: AppColors.darkColor),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyles.styleRegular14(
          context,
        ).copyWith(color: Colors.grey.shade400),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
    IconData? icon,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: textColor, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
