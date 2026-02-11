import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/monitor/presentation/bloc/monitor_bloc.dart';
import 'package:sehty/features/monitor/presentation/widgets/medicine_bottom_sheet_widgets/medication_compliance_summary.dart';
import 'package:sehty/features/monitor/presentation/widgets/medicine_bottom_sheet_widgets/medication_item_widget.dart';
import 'package:sehty/features/monitor/presentation/widgets/medicine_bottom_sheet_widgets/shared_data_note_widget.dart';

class PatientMedicationBottomSheet extends StatefulWidget {
  const PatientMedicationBottomSheet({
    super.key,
    required this.memberId,
    required this.patientName,
    required this.phoneNumber,
  });

  final int memberId;
  final String patientName;
  final String phoneNumber;

  @override
  State<PatientMedicationBottomSheet> createState() =>
      _PatientMedicationBottomSheetState();
}

class _PatientMedicationBottomSheetState
    extends State<PatientMedicationBottomSheet> {
  @override
  void initState() {
    super.initState();
    context.read<MonitorBloc>().add(
      GetFamilyMemberMedicationsEvent(memberId: widget.memberId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.80,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 12,
        ),
        decoration: const BoxDecoration(
          color: AppColors.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        'أدوية ${widget.patientName}',
                        style: AppStyles.styleBold20(context),
                      ),
                      Text(
                        widget.phoneNumber,
                        style: AppStyles.styleRegular14(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<MonitorBloc, MonitorState>(
                builder: (context, state) {
                  if (state is MonitorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MonitorError) {
                    return Center(child: Text(state.message));
                  } else if (state is FamilyMemberMedicationsLoaded) {
                    final stats = state.memberMedications.statistics;
                    final medications =
                        state.memberMedications.medications ?? [];

                    return Column(
                      children: [
                        // Compliance Summary
                        MedicationComplianceSummary(
                          complianceRate: stats?.percentage ?? 0,
                          takenCount: stats?.takenToday ?? 0,
                          totalCount: stats?.totalToday ?? 0,
                        ),
                        const SizedBox(height: 24),

                        // Divider
                        const Divider(height: 0, color: Color(0xffF2F4F7)),
                        const SizedBox(height: 24),
                        // Medications List
                        Flexible(
                          child: medications.isEmpty
                              ? Center(
                                  child: Text(
                                    'No medications found',
                                    style: AppStyles.styleRegular14(context),
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Column(
                                    children: medications.map((med) {
                                      final map = med as Map<String, dynamic>;
                                      return MedicationItemWidget(
                                        name: map['name']?.toString() ?? '',
                                        dose: map['dose']?.toString() ?? '',
                                        scheduledTime:
                                            map['scheduled_at']?.toString() ??
                                            '',
                                        takenTime: map['taken_at']?.toString(),
                                        isTaken:
                                            map['is_taken'] == true ||
                                            map['taken_at'] != null,
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ),
                        // Footer Note
                        const SharedDataNoteWidget(),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
