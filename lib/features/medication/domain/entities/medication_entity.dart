import 'package:equatable/equatable.dart';
import 'package:sehty/features/medication/domain/entities/log_entity.dart';
import 'package:sehty/features/medication/domain/entities/schedule_entity.dart';

class MedicationEntity extends Equatable {
  // Entity corresponding to MedicationModel
  final int? id;
  final String? name;
  final String? dosage;
  final int? totalQuantity;
  final int? remainingQuantity;
  final double? percentage;
  final String? startDate;
  final dynamic endDate;
  final bool? isActive;
  final dynamic notes;
  final List<MedicationScheduleEntity>? schedules;
  final List<MedicationLogEntity>? logs;
  final DateTime? createdAt;

  const MedicationEntity({
    this.id,
    this.name,
    this.dosage,
    this.totalQuantity,
    this.remainingQuantity,
    this.percentage,
    this.startDate,
    this.endDate,
    this.isActive,
    this.notes,
    this.schedules,
    this.logs,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    dosage,
    totalQuantity,
    remainingQuantity,
    percentage,
    startDate,
    endDate,
    isActive,
    notes,
    schedules,
    logs,
    createdAt,
  ];
}
