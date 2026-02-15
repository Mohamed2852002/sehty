import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sehty/core/themes/app_colors.dart';
import 'package:sehty/core/utils/extensions.dart';
import 'package:sehty/core/utils/app_styles.dart';
import 'package:sehty/features/medication/domain/entities/medication_entity.dart';
import 'package:sehty/features/medication/presentation/bloc/medication_bloc.dart';

class MedicationListItem extends StatelessWidget {
  final MedicationEntity medication;

  const MedicationListItem({super.key, required this.medication});

  bool _isScheduleTaken(String scheduleTime) {
    if (medication.logs == null || medication.logs!.isEmpty) {
      return false;
    }

    final now = DateTime.now();
    final today = DateFormat('yyyy-MM-dd', 'en').format(now);

    for (var log in medication.logs!) {
      if (log.scheduledAt != null) {
        final logTime = DateFormat('HH:mm', 'en').format(log.scheduledAt!);
        final logDate = DateFormat('yyyy-MM-dd', 'en').format(log.scheduledAt!);
        if (logDate == today &&
            _normalizeTime(logTime) == _normalizeTime(scheduleTime)) {
          return true;
        }
      }
    }
    return false;
  }

  String _normalizeTime(String time) {
    final parts = time.split(':');
    if (parts.length == 2) {
      final hour = parts[0].padLeft(2, '0');
      final minute = parts[1].padLeft(2, '0');
      return '$hour:$minute';
    }
    return time;
  }

  String? _getNextPendingSchedule() {
    if (medication.schedules == null || medication.schedules!.isEmpty) {
      return null;
    }

    for (var schedule in medication.schedules!) {
      if (schedule.time != null && !_isScheduleTaken(schedule.time!)) {
        return schedule.time;
      }
    }
    return null;
  }

  String _formatTime(String time, BuildContext context) {
    if (time.isEmpty) return '';
    final parts = time.split(':');
    if (parts.length != 2) return time;

    try {
      final hour = int.parse(parts[0]);
      final minute = parts[1];

      final period = hour >= 12 ? context.l10n.pm : context.l10n.am;
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

      return '${displayHour.toString().padLeft(2, '0')}:$minute $period';
    } catch (e) {
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextPendingTime = _getNextPendingSchedule();
    final isFullyTaken = nextPendingTime == null;

    Color statusColor;
    Color borderColor;
    Color backgroundColor;
    IconData icon;
    Color iconColor;

    if (isFullyTaken) {
      statusColor = AppColors.greenColor;
      borderColor = AppColors.greenColor.withValues(alpha: 0.2);
      backgroundColor = AppColors.greenColor.withValues(alpha: 0.05);
      icon = Icons.check_circle_outline;
      iconColor = AppColors.greenColor;
    } else {
      statusColor = AppColors.secondary;
      borderColor = const Color(0xffE5E7EB);
      backgroundColor = Colors.white;
      icon = Icons.cancel_outlined;
      iconColor = AppColors.secondary;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.name ?? '',
                  style: AppStyles.styleBold16(context),
                ),
                if (medication.schedules != null)
                  Wrap(
                    spacing: 8,
                    // runSpacing: 4,
                    children: medication.schedules!.map((schedule) {
                      final isTaken = _isScheduleTaken(schedule.time ?? '');
                      return Text(
                        _formatTime(schedule.time ?? '', context),
                        style: AppStyles.styleRegular14(context).copyWith(
                          color: isTaken ? AppColors.greenColor : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
          if (!isFullyTaken) ...[
            InkWell(
              onTap: () {
                final now = DateTime.now();
                final dateStr = DateFormat('yyyy-MM-dd', 'en').format(now);
                final scheduledAt = '$dateStr $nextPendingTime:00';

                context.read<MedicationBloc>().add(
                  ConfirmMedicationTakenEvent(
                    medicineId: medication.id!,
                    scheduledAt: scheduledAt,
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BlocBuilder<MedicationBloc, MedicationState>(
                  builder: (context, state) {
                    if (state is ConfirmMedicationLoading &&
                        state.medicineId == medication.id) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    return Text(
                      context.l10n.confirmTaking,
                      style: AppStyles.styleRegular14(
                        context,
                      ).copyWith(color: Colors.white),
                    );
                  },
                ),
              ),
            ),
          ] else ...[
            Icon(icon, color: iconColor, size: 28),
          ],
        ],
      ),
    );
  }
}
