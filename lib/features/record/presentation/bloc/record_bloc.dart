import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';
import 'package:sehty/features/record/domain/entities/shared_medical_record_entity.dart';
import 'package:sehty/features/record/domain/entities/shared_record_info_entity.dart';
import 'package:sehty/features/record/domain/repositories/record_repo.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  final RecordRepo recordRepo;

  RecordBloc({required this.recordRepo}) : super(RecordInitial()) {
    on<GetMedicalRecordsEvent>(_onGetMedicalRecords);
    on<UploadMedicalRecordEvent>(_onUploadMedicalRecord);
    on<ShareMedicalRecordEvent>(_onShareMedicalRecord);
    on<GetSharedMedicalRecordEvent>(_onGetSharedMedicalRecord);
  }

  Future<void> _onGetMedicalRecords(
    GetMedicalRecordsEvent event,
    Emitter<RecordState> emit,
  ) async {
    emit(RecordLoading());
    final result = await recordRepo.getListOfMedicalRecords();
    result.fold(
      (failure) => emit(RecordError(message: failure.errorMessage)),
      (records) => emit(MedicalRecordsLoaded(records: records)),
    );
  }

  Future<void> _onUploadMedicalRecord(
    UploadMedicalRecordEvent event,
    Emitter<RecordState> emit,
  ) async {
    emit(UploadMedicalRecordLoading());
    final result = await recordRepo.uploadMedicalRecord(
      filePath: event.filePath,
      fileType: event.fileType,
      doctorName: event.doctorName,
      recordDate: event.recordDate,
      labName: event.labName,
      name: event.name,
    );
    result.fold(
      (failure) =>
          emit(UploadMedicalRecordError(message: failure.errorMessage)),
      (record) => emit(MedicalRecordUploaded(record: record)),
    );
  }

  Future<void> _onShareMedicalRecord(
    ShareMedicalRecordEvent event,
    Emitter<RecordState> emit,
  ) async {
    emit(ShareMedicalRecordLoading());
    final result = await recordRepo.shareMedicalRecord(
      recordId: event.recordId,
    );
    result.fold(
      (failure) => emit(ShareMedicalRecordError(message: failure.errorMessage)),
      (sharedRecordInfo) => emit(MedicalRecordShared(sharedRecordInfo: sharedRecordInfo)),
    );
  }

  Future<void> _onGetSharedMedicalRecord(
    GetSharedMedicalRecordEvent event,
    Emitter<RecordState> emit,
  ) async {
    emit(GetSharedMedicalRecordLoading());
    final result = await recordRepo.getSharedMedicalRecord(
      shareToken: event.shareToken,
    );
    result.fold(
      (failure) =>
          emit(GetSharedMedicalRecordError(message: failure.errorMessage)),
      (sharedRecord) =>
          emit(SharedMedicalRecordLoaded(sharedRecord: sharedRecord)),
    );
  }
}
