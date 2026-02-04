import 'package:flutter/material.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_strings.dart';
import 'package:sehty/core/utils/app_styles.dart';

class UploadMedicalRecordDialog extends StatefulWidget {
  const UploadMedicalRecordDialog({super.key});

  @override
  State<UploadMedicalRecordDialog> createState() =>
      _UploadMedicalRecordDialogState();
}

class _UploadMedicalRecordDialogState extends State<UploadMedicalRecordDialog> {
  String? _selectedCategory;
  final TextEditingController _fileNameController = TextEditingController();
  final TextEditingController _labNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCategory = AppStrings.analyses;
  }

  @override
  void dispose() {
    _fileNameController.dispose();
    _labNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      AppStrings.analyses,
      AppStrings.prescriptions,
      AppStrings.xrays,
      AppStrings.reports,
    ];

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
                    AppStrings.uploadMedicalFile,
                    style: AppStyles.styleBold20(context),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildFieldLabel(context, AppStrings.fileName),
              const SizedBox(height: 8),
              _buildTextField(
                context,
                controller: _fileNameController,
                hint: AppStrings.fileNameExample,
              ),
              const SizedBox(height: 20),
              _buildFieldLabel(context, AppStrings.category),
              const SizedBox(height: 8),
              _buildDropdown(context, categories),
              const SizedBox(height: 20),
              _buildFieldLabel(context, AppStrings.labName),
              const SizedBox(height: 8),
              _buildTextField(
                context,
                controller: _labNameController,
                hint: AppStrings.labNameExample,
              ),
              const SizedBox(height: 20),
              _buildFieldLabel(context, AppStrings.file),
              const SizedBox(height: 8),
              _buildUploadArea(context),
              const SizedBox(height: 24),
              _buildSecurityNote(context),
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
                      text: AppStrings.uploadFile,
                      color: AppColors.primary,
                      textColor: Colors.white,
                      onPressed: () {
                        // Handle upload
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
  }) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,
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
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, List<String> categories) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCategory,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, color: AppColors.primary),
          items: categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category, style: AppStyles.styleRegular14(context)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedCategory = newValue;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildUploadArea(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.file_upload_outlined,
              color: AppColors.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.clickToSelectFile,
            style: AppStyles.styleBold16(context),
          ),
          const SizedBox(height: 4),
          Text(
            AppStrings.orImagePdfNote,
            style: AppStyles.styleRegular12(
              context,
            ).copyWith(color: AppColors.darkColor),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityNote(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lock_outline,
            color: Colors.blue.withValues(alpha: 0.5),
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              AppStrings.fileSecurityNote,
              style: AppStyles.styleRegular12(
                context,
              ).copyWith(color: Colors.blue.withValues(alpha: 0.7)),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text(
              text,
              style: AppStyles.styleBold16(context).copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
