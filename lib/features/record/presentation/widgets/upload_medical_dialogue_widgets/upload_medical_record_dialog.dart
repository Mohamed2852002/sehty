import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_functions.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_drop_down_menu.dart';
import 'package:sehty/features/record/presentation/bloc/record_bloc.dart';
import 'package:sehty/features/record/presentation/widgets/upload_medical_dialogue_widgets/upload_area_widget.dart';
import 'package:sehty/features/record/presentation/widgets/upload_medical_dialogue_widgets/security_note_widget.dart';

class UploadMedicalRecordDialog extends StatefulWidget {
  const UploadMedicalRecordDialog({super.key});

  @override
  State<UploadMedicalRecordDialog> createState() =>
      _UploadMedicalRecordDialogState();
}

class _UploadMedicalRecordDialogState extends State<UploadMedicalRecordDialog> {
  final TextEditingController _fileNameController = TextEditingController();
  final TextEditingController _labNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  String? _selectedCategory;
  String? _selectedFilePath;
  String? _selectedFileName;
  bool _isUploading = false;
  bool _showFileError = false;

  // Map category display names to API values
  static const Map<String, String> _categoryToFileType = {
    'analysis': 'lab_test',
    'xrays': 'radiology',
    'prescriptions': 'prescription',
    'reports': 'report',
  };

  List<String> _getCategoryItems(BuildContext context) => [
    context.l10n.analysis,
    context.l10n.xrays,
    context.l10n.prescriptions,
    context.l10n.reports,
  ];

  String _getFileTypeForCategory(BuildContext context, String? category) {
    if (category == null) return '';
    final items = _getCategoryItems(context);
    final keys = _categoryToFileType.keys.toList();
    final index = items.indexOf(category);
    if (index >= 0 && index < keys.length) {
      return _categoryToFileType[keys[index]] ?? '';
    }
    return '';
  }

  bool _isPrescription(BuildContext context) {
    return _getFileTypeForCategory(context, _selectedCategory) ==
        'prescription';
  }

  bool _isAnalysis(BuildContext context) {
    return _getFileTypeForCategory(context, _selectedCategory) == 'lab_test';
  }

  bool _isXrays(BuildContext context) {
    return _getFileTypeForCategory(context, _selectedCategory) == 'radiology';
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFilePath = result.files.single.path;
        _selectedFileName = result.files.single.name;
        _showFileError = false;
      });
    }
  }

  void _uploadFile(BuildContext context) {
    if (_selectedFilePath == null) {
      setState(() {
        _showFileError = true;
      });
      return;
    }

    if (_fileNameController.text.trim().isEmpty || _selectedCategory == null) {
      return;
    }

    final fileType = _getFileTypeForCategory(context, _selectedCategory);

    context.read<RecordBloc>().add(
      UploadMedicalRecordEvent(
        filePath: _selectedFilePath!,
        fileType: fileType,
        doctorName: _isPrescription(context) ? _labNameController.text : '',
        recordDate: DateTime.now().toString().split(' ')[0],
        labName: _isAnalysis(context) ? _labNameController.text : '',
        name: _fileNameController.text,
      ),
    );
  }

  @override
  void dispose() {
    _fileNameController.dispose();
    _labNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecordBloc, RecordState>(
      listener: (context, state) {
        if (state is UploadMedicalRecordLoading) {
          setState(() => _isUploading = true);
        } else if (state is MedicalRecordUploaded) {
          setState(() => _isUploading = false);
          Navigator.pop(context, true);
        } else if (state is UploadMedicalRecordError) {
          setState(() => _isUploading = false);
          AppFunctions.showCustomSnackBar(
            context,
            state.message,
            backgroundColor: Colors.red,
          );
        }
      },
      child: CustomDialog(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.uploadMedicalFile,
                      style: AppStyles.styleBold20(context),
                    ),
                  ),
                  IconButton(
                    onPressed: _isUploading
                        ? null
                        : () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.darkColor),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomTitleAndTextFormField(
                controller: _fileNameController,
                label: context.l10n.fileName,
                hint: context.l10n.fileNameExample,
              ),
              const SizedBox(height: 20),
              CustomTitleAndDropDownMenu(
                label: context.l10n.category,
                value: _selectedCategory,
                items: _getCategoryItems(context),
                onChanged: (val) {
                  setState(() {
                    _selectedCategory = val;
                    _labNameController.clear();
                  });
                },
              ),
              const SizedBox(height: 20),
              // Show doctor name for prescriptions, lab name for analysis
              if (_isPrescription(context))
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomTitleAndTextFormField(
                    controller: _labNameController,
                    label: context.l10n.doctorName,
                    hint: context.l10n.doctorReportExample,
                  ),
                ),
              if (_isAnalysis(context) || _isXrays(context))
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomTitleAndTextFormField(
                    controller: _labNameController,
                    label: context.l10n.labName,
                    hint: context.l10n.labNameExample,
                  ),
                ),
              UploadAreaWidget(
                onTap: _isUploading ? null : _pickFile,
                selectedFileName: _selectedFileName,
                showError: _showFileError,
                errorMessage: context.l10n.pleaseSelectFile,
              ),
              const SizedBox(height: 24),
              const SecurityNoteWidget(),
              const SizedBox(height: 32),
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    child: CustomButton(
                      content: _isUploading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              context.l10n.uploadFile,
                              style: AppStyles.styleBold16(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _uploadFile(context);
                        } else {
                          setState(() {
                            _autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      content: Text(
                        context.l10n.cancel,
                        style: AppStyles.styleBold16(
                          context,
                        ).copyWith(color: Colors.black),
                      ),
                      onTap: _isUploading ? null : () => Navigator.pop(context),
                      color: AppColors.greyButtonColor,
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
}
