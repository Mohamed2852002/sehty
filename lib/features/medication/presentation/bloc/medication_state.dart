part of 'medication_bloc.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object?> get props => [];
}

class MedicationInitial extends MedicationState {}

class MedicationLoading extends MedicationState {}

class TodayMedicationLoading extends MedicationState {}

class AddMedicationLoading extends MedicationState {}

class ConfirmMedicationLoading extends MedicationState {}

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

class TodayMedicationError extends MedicationState {
  final String message;
  const TodayMedicationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class AddMedicationError extends MedicationState {
  final String message;
  const AddMedicationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class ConfirmMedicationError extends MedicationState {
  final String message;
  const ConfirmMedicationError({required this.message});

  @override
  List<Object?> get props => [message];
}
