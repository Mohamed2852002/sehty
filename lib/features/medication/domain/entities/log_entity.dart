import 'package:equatable/equatable.dart';

class MedicationLogEntity extends Equatable {
  final int? id;
  final DateTime? scheduledAt;
  final DateTime? takenAt;
  final String? status;
  final DateTime? confirmedAt;

  const MedicationLogEntity({
    this.id,
    this.scheduledAt,
    this.takenAt,
    this.status,
    this.confirmedAt,
  });

  @override
  List<Object?> get props => [id, scheduledAt, takenAt, status, confirmedAt];
}
