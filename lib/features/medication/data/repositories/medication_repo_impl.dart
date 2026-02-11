import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/medication/data/datasources/medication_remote_data_source.dart';
import 'package:sehty/features/medication/data/models/medication_model/medication_model.dart';
import 'package:sehty/features/medication/domain/entities/log_entity.dart';
import 'package:sehty/features/medication/domain/entities/medication_entity.dart';
import 'package:sehty/features/medication/domain/entities/schedule_entity.dart';
import 'package:sehty/features/medication/domain/repositories/medication_repo.dart';

class MedicationRepoImpl implements MedicationRepo {
  final MedicationRemoteDataSource medicationRemoteDataSource;

  MedicationRepoImpl({required this.medicationRemoteDataSource});

  MedicationEntity _mapModelToEntity(MedicationModel model) {
    return MedicationEntity(
      id: model.id,
      name: model.name,
      dosage: model.dosage,
      totalQuantity: model.totalQuantity,
      remainingQuantity: model.remainingQuantity,
      percentage: model.percentage,
      startDate: model.startDate,
      endDate: model.endDate,
      isActive: model.isActive,
      notes: model.notes,
      schedules: model.schedules
          ?.map(
            (s) => MedicationScheduleEntity(
              id: s.id,
              time: s.time,
              daysOfWeek: s.daysOfWeek,
            ),
          )
          .toList(),
      logs: model.logs
          ?.map(
            (l) => MedicationLogEntity(
              id: l.id,
              scheduledAt: l.scheduledAt,
              takenAt: l.takenAt,
              status: l.status,
              confirmedAt: l.confirmedAt,
            ),
          )
          .toList(),
      createdAt: model.createdAt,
    );
  }

  @override
  Future<Either<Failure, List<MedicationEntity>>> getListOfMedications() async {
    try {
      final response = await medicationRemoteDataSource.getListOfMedications();
      log('Response in getListOfMedications: $response');
      final List<dynamic> data = response['data'] ?? [];
      final medications = data
          .map((json) => _mapModelToEntity(MedicationModel.fromJson(json)))
          .toList();
      return Right(medications);
    } on DioException catch (e) {
      log(
        'Error in MedicationRepoImpl : getListOfMedications: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in MedicationRepoImpl : getListOfMedications: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MedicationEntity>>> getTodayMedications() async {
    try {
      final response = await medicationRemoteDataSource.getTodayMedications();
      log('Response in getTodayMedications: $response');
      final List<dynamic> data = response['data'] ?? [];
      final medications = data
          .map((json) => _mapModelToEntity(MedicationModel.fromJson(json)))
          .toList();
      return Right(medications);
    } on DioException catch (e) {
      log('Error in MedicationRepoImpl : getTodayMedications: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in MedicationRepoImpl : getTodayMedications: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MedicationEntity>> addMedication({
    required String name,
    required String dosage,
    required int totalQuantity,
    required String startDate,
    required List<String> schedules, // List of time strings
  }) async {
    try {
      final response = await medicationRemoteDataSource.addMedication(
        name: name,
        dosage: dosage,
        totalQuantity: totalQuantity,
        startDate: startDate,
        schedules: schedules,
      );
      log('Response in addMedication: $response');
      final medication = _mapModelToEntity(
        MedicationModel.fromJson(response['data']),
      );
      return Right(medication);
    } on DioException catch (e) {
      log('Error in MedicationRepoImpl : addMedication: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in MedicationRepoImpl : addMedication: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmMedicationTaken({
    required int medicineId,
    required String scheduledAt,
  }) async {
    try {
      final response = await medicationRemoteDataSource.confirmMedicationTaken(
        medicineId: medicineId,
        scheduledAt: scheduledAt,
      );
      log('Response in confirmMedicationTaken: $response');
      return const Right(unit);
    } on DioException catch (e) {
      log(
        'Error in MedicationRepoImpl : confirmMedicationTaken: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in MedicationRepoImpl : confirmMedicationTaken: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
