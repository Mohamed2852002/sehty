import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';

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

  Future<Either<Failure, Unit>> shareMedicalRecord({required int recordId});
}
