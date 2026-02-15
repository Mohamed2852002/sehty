part of 'medication_bloc.dart';

abstract class MedicationEvent extends Equatable {
  const MedicationEvent();

  @override
  List<Object?> get props => [];
}

class GetMedicationsEvent extends MedicationEvent {}

class GetTodayMedicationsEvent extends MedicationEvent {}

class AddMedicationEvent extends MedicationEvent {
  final String name;
  final String dosage;
  final int totalQuantity;
  final String startDate;
  final List<String> schedules;

  const AddMedicationEvent({
    required this.name,
    required this.dosage,
    required this.totalQuantity,
    required this.startDate,
    required this.schedules,
  });

  @override
  List<Object?> get props => [
    name,
    dosage,
    totalQuantity,
    startDate,
    schedules,
  ];
}

class ConfirmMedicationTakenEvent extends MedicationEvent {
  final int medicineId;
  final String scheduledAt;

  const ConfirmMedicationTakenEvent({
    required this.medicineId,
    required this.scheduledAt,
  });

  @override
  List<Object?> get props => [medicineId, scheduledAt];
}
