part of 'record_bloc.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object?> get props => [];
}

class RecordInitial extends RecordState {}

class RecordLoading extends RecordState {}

class MedicalRecordsLoaded extends RecordState {
  final List<MedicalRecordEntity> records;
  const MedicalRecordsLoaded({required this.records});

  @override
  List<Object?> get props => [records];
}

class MedicalRecordUploaded extends RecordState {
  final MedicalRecordEntity record;
  const MedicalRecordUploaded({required this.record});

  @override
  List<Object?> get props => [record];
}

class MedicalRecordShared extends RecordState {}

class RecordError extends RecordState {
  final String message;
  const RecordError({required this.message});

  @override
  List<Object?> get props => [message];
}
