import 'package:equatable/equatable.dart';

class ScheduleEntity extends Equatable {
  final int? id;
  final String? time;
  final List<int>? daysOfWeek;

  const ScheduleEntity({this.id, this.time, this.daysOfWeek});

  @override
  List<Object?> get props => [id, time, daysOfWeek];
}

class LogEntity extends Equatable {
  final int? id;
  final DateTime? scheduledAt;
  final DateTime? takenAt;
  final String? status;
  final DateTime? confirmedAt;

  const LogEntity({
    this.id,
    this.scheduledAt,
    this.takenAt,
    this.status,
    this.confirmedAt,
  });

  @override
  List<Object?> get props => [id, scheduledAt, takenAt, status, confirmedAt];
}

class MedicationEntity extends Equatable {
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
  final List<ScheduleEntity>? schedules;
  final List<LogEntity>? logs;
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
