import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/medication/domain/entities/medication_entity.dart';

abstract class MedicationRepo {
  Future<Either<Failure, List<MedicationEntity>>> getListOfMedications();

  Future<Either<Failure, List<MedicationEntity>>> getTodayMedications();

  Future<Either<Failure, MedicationEntity>> addMedication({
    required String name,
    required String dosage,
    required int totalQuantity,
    required String startDate,
    required List<Map<String, dynamic>> schedules,
  });

  Future<Either<Failure, Unit>> confirmMedicationTaken({
    required int medicineId,
    required String scheduledAt,
  });
}
