import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/core/utils/widgets/custom_button.dart';
import 'package:sehty/core/utils/widgets/custom_dialog.dart';
import 'package:sehty/core/utils/widgets/custom_title_and_text_form_field.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';
import 'package:intl/intl.dart';

class AddMedicationDialog extends StatefulWidget {
  const AddMedicationDialog({super.key});

  @override
  State<AddMedicationDialog> createState() => _AddMedicationDialogState();
}

class _AddMedicationDialogState extends State<AddMedicationDialog> {
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();
  final _startDateController = TextEditingController();
  final _totalQuantityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final List<TextEditingController> _scheduleControllers = [
    TextEditingController(),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    _startDateController.dispose();
    _totalQuantityController.dispose();
    for (var controller in _scheduleControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addSchedule() {
    setState(() {
      _scheduleControllers.add(TextEditingController());
    });
  }

  void _removeSchedule(int index) {
    if (_scheduleControllers.length > 1) {
      setState(() {
        _scheduleControllers[index].dispose();
        _scheduleControllers.removeAt(index);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        final now = DateTime.now();
        final dt = DateTime(
          now.year,
          now.month,
          now.day,
          picked.hour,
          picked.minute,
        );
        controller.text = DateFormat('HH:mm').format(dt);
      });
    }
  }

  void _onSave() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final dose = _doseController.text.trim();
      final startDate = _startDateController.text.trim();
      final totalQuantity =
          int.tryParse(_totalQuantityController.text.trim()) ?? 0;

      final schedules = _scheduleControllers
          .where((c) => c.text.isNotEmpty)
          .map((c) => c.text.trim())
          .toList();

      context.read<MedicationBloc>().add(
        AddMedicationEvent(
          name: name,
          dosage: dose,
          totalQuantity: totalQuantity,
          startDate: startDate,
          schedules: schedules,
        ),
      );
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicationBloc, MedicationState>(
      listener: (context, state) {
        if (state is MedicationAdded) {
          Navigator.pop(context);
          context.read<MedicationBloc>().add(GetMedicationsEvent());
          context.read<MedicationBloc>().add(GetTodayMedicationsEvent());
        }
      },
      child: CustomDialog(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.addNewMedication,
                        style: AppStyles.styleBold20(context),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.grey),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xffEFFBFF),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffD0F0FB)),
                  ),
                  child: Text(
                    context.l10n.medicationReminderNote,
                    style: AppStyles.styleRegular12(
                      context,
                    ).copyWith(color: const Color(0xff27BED7), height: 1.5),
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  spacing: 16,
                  children: [
                    CustomTitleAndTextFormField(
                      label: context.l10n.medicineName,
                      hint: context.l10n.medicineNameExample,
                      controller: _nameController,
                    ),
                    CustomTitleAndTextFormField(
                      label: context.l10n.dose,
                      hint: context.l10n.doseExample,
                      controller: _doseController,
                    ),
                    ..._scheduleControllers.asMap().entries.map((entry) {
                      final index = entry.key;
                      final controller = entry.value;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: CustomTitleAndTextFormField(
                              label: context.l10n.takingSchedules,
                              hint: '08:00', // Example format
                              controller: controller,
                              readOnly: true,
                              onTap: () => _selectTime(context, controller),
                            ),
                          ),
                          if (_scheduleControllers.length > 1)
                            IconButton(
                              onPressed: () => _removeSchedule(index),
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                color: Colors.red,
                              ),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _addSchedule,
                  child: Row(
                    spacing: 4,
                    children: [
                      const Icon(Icons.add, color: Color(0xff26C6DA)),
                      Text(
                        context.l10n.addAnotherSchedule,
                        style: AppStyles.styleBold14(
                          context,
                        ).copyWith(color: const Color(0xff26C6DA)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomTitleAndTextFormField(
                        label: context.l10n.startDate,
                        hint: '2026-01-01',
                        controller: _startDateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                      ),
                    ),
                    Expanded(
                      child: CustomTitleAndTextFormField(
                        label: context.l10n.totalQuantity,
                        hint: '10',
                        controller: _totalQuantityController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomButton(
                        verticalPadding: 14,
                        content: Text(
                          context.l10n.addMedication,
                          style: AppStyles.styleBold16(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                        onTap: _onSave,
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        color: const Color(0xffE9EEF0),
                        verticalPadding: 14,
                        content: Text(
                          context.l10n.cancel,
                          style: AppStyles.styleBold16(
                            context,
                          ).copyWith(color: const Color(0xff6A7282)),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
