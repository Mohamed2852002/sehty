import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/record/data/datasources/record_remote_data_source.dart';
import 'package:sehty/features/record/data/models/medical_record_model.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';
import 'package:sehty/features/record/domain/repositories/record_repo.dart';

class RecordRepoImpl implements RecordRepo {
  final RecordRemoteDataSource recordRemoteDataSource;

  RecordRepoImpl({required this.recordRemoteDataSource});

  MedicalRecordEntity _mapModelToEntity(MedicalRecordModel model) {
    return MedicalRecordEntity(
      id: model.id,
      name: model.name,
      fileType: model.fileType,
      doctorName: model.doctorName,
      labName: model.labName,
      recordDate: model.recordDate,
      qrCode: model.qrCode,
      hasActiveShare: model.hasActiveShare,
      shareExpiresAt: model.shareExpiresAt,
      createdAt: model.createdAt,
    );
  }

  @override
  Future<Either<Failure, List<MedicalRecordEntity>>>
  getListOfMedicalRecords() async {
    try {
      final response = await recordRemoteDataSource.getListOfMedicalRecords();
      log('Response in getListOfMedicalRecords: $response');
      final List<dynamic> data = response['data'] ?? [];
      final records = data
          .map((json) => _mapModelToEntity(MedicalRecordModel.fromJson(json)))
          .toList();
      return Right(records);
    } on DioException catch (e) {
      log('Error in RecordRepoImpl : getListOfMedicalRecords: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in RecordRepoImpl : getListOfMedicalRecords: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MedicalRecordEntity>> uploadMedicalRecord({
    required String filePath,
    required String fileType,
    required String doctorName,
    required String recordDate,
    required String labName,
    required String name,
  }) async {
    try {
      final response = await recordRemoteDataSource.uploadMedicalRecord(
        filePath: filePath,
        fileType: fileType,
        doctorName: doctorName,
        recordDate: recordDate,
        labName: labName,
        name: name,
      );
      log('Response in uploadMedicalRecord: $response');
      final record = _mapModelToEntity(
        MedicalRecordModel.fromJson(response['data']),
      );
      return Right(record);
    } on DioException catch (e) {
      log('Error in RecordRepoImpl : uploadMedicalRecord: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in RecordRepoImpl : uploadMedicalRecord: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> shareMedicalRecord({
    required int recordId,
  }) async {
    try {
      final response = await recordRemoteDataSource.shareMedicalRecord(
        recordId: recordId,
      );
      log('Response in shareMedicalRecord: $response');
      return const Right(unit);
    } on DioException catch (e) {
      log('Error in RecordRepoImpl : shareMedicalRecord: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in RecordRepoImpl : shareMedicalRecord: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
