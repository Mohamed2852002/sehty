part of 'record_bloc.dart';

abstract class RecordEvent extends Equatable {
  const RecordEvent();

  @override
  List<Object?> get props => [];
}

class GetMedicalRecordsEvent extends RecordEvent {}

class UploadMedicalRecordEvent extends RecordEvent {
  final String filePath;
  final String fileType;
  final String doctorName;
  final String recordDate;
  final String labName;
  final String name;

  const UploadMedicalRecordEvent({
    required this.filePath,
    required this.fileType,
    required this.doctorName,
    required this.recordDate,
    required this.labName,
    required this.name,
  });

  @override
  List<Object?> get props => [
    filePath,
    fileType,
    doctorName,
    recordDate,
    labName,
    name,
  ];
}

class ShareMedicalRecordEvent extends RecordEvent {
  final int recordId;
  const ShareMedicalRecordEvent({required this.recordId});

  @override
  List<Object?> get props => [recordId];
}
