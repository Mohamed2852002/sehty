part of 'record_bloc.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object?> get props => [];
}

class RecordInitial extends RecordState {}

class RecordLoading extends RecordState {}

class UploadMedicalRecordLoading extends RecordState {}

class ShareMedicalRecordLoading extends RecordState {}

class GetSharedMedicalRecordLoading extends RecordState {}

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

class MedicalRecordShared extends RecordState {
  final SharedRecordInfoEntity sharedRecordInfo;
  const MedicalRecordShared({required this.sharedRecordInfo});

  @override
  List<Object?> get props => [sharedRecordInfo];
}

class SharedMedicalRecordLoaded extends RecordState {
  final SharedMedicalRecordEntity sharedRecord;
  const SharedMedicalRecordLoaded({required this.sharedRecord});

  @override
  List<Object?> get props => [sharedRecord];
}

class RecordError extends RecordState {
  final String message;
  const RecordError({required this.message});

  @override
  List<Object?> get props => [message];
}

class UploadMedicalRecordError extends RecordState {
  final String message;
  const UploadMedicalRecordError({required this.message});

  @override
  List<Object?> get props => [message];
}

class ShareMedicalRecordError extends RecordState {
  final String message;
  const ShareMedicalRecordError({required this.message});

  @override
  List<Object?> get props => [message];
}

class GetSharedMedicalRecordError extends RecordState {
  final String message;
  const GetSharedMedicalRecordError({required this.message});

  @override
  List<Object?> get props => [message];
}
