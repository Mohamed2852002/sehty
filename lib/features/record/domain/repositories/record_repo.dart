import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';
import 'package:sehty/features/record/domain/entities/shared_medical_record_entity.dart';
import 'package:sehty/features/record/domain/entities/shared_record_info_entity.dart';

abstract class RecordRepo {
  Future<Either<Failure, List<MedicalRecordEntity>>> getListOfMedicalRecords();

  Future<Either<Failure, MedicalRecordEntity>> uploadMedicalRecord({
    required String filePath,
    required String fileType,
    required String doctorName,
    required String recordDate,
    required String labName,
    required String name,
  });

  Future<Either<Failure, SharedRecordInfoEntity>> shareMedicalRecord({
    required int recordId,
  });

  Future<Either<Failure, SharedMedicalRecordEntity>> getSharedMedicalRecord({
    required String shareToken,
  });
}
