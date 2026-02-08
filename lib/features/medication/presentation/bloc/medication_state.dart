part of 'medication_bloc.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object?> get props => [];
}

class MedicationInitial extends MedicationState {}

class MedicationLoading extends MedicationState {}

class MedicationsLoaded extends MedicationState {
  final List<MedicationEntity> medications;
  const MedicationsLoaded({required this.medications});

  @override
  List<Object?> get props => [medications];
}

class TodayMedicationsLoaded extends MedicationState {
  final List<MedicationEntity> medications;
  const TodayMedicationsLoaded({required this.medications});

  @override
  List<Object?> get props => [medications];
}

class MedicationAdded extends MedicationState {
  final MedicationEntity medication;
  const MedicationAdded({required this.medication});

  @override
  List<Object?> get props => [medication];
}

class MedicationConfirmed extends MedicationState {}

class MedicationError extends MedicationState {
  final String message;
  const MedicationError({required this.message});

  @override
  List<Object?> get props => [message];
}
