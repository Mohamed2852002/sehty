import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/record/data/datasources/record_remote_data_source.dart';
import 'package:sehty/features/record/data/models/medical_record_model.dart';
import 'package:sehty/features/record/data/models/shared_medical_record_model.dart';
import 'package:sehty/features/record/data/models/shared_record_info_model.dart';
import 'package:sehty/features/record/domain/entities/medical_record_entity.dart';
import 'package:sehty/features/record/domain/entities/shared_medical_record_entity.dart';
import 'package:sehty/features/record/domain/entities/shared_record_info_entity.dart';
import 'package:sehty/features/record/domain/repositories/record_repo.dart';

class RecordRepoImpl implements RecordRepo {
  final RecordRemoteDataSource recordRemoteDataSource;

  RecordRepoImpl({required this.recordRemoteDataSource});

  @override
  Future<Either<Failure, List<MedicalRecordEntity>>>
  getListOfMedicalRecords() async {
    try {
      final response = await recordRemoteDataSource.getListOfMedicalRecords();
      log('Response in getListOfMedicalRecords: $response');
      final List<dynamic> data = response['data'] ?? [];
      final records = data
          .map((json) => MedicalRecordModel.fromJson(json).toEntity())
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
      final record = MedicalRecordModel.fromJson(response['data']).toEntity();
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
  Future<Either<Failure, SharedRecordInfoEntity>> shareMedicalRecord({
    required int recordId,
  }) async {
    try {
      final response = await recordRemoteDataSource.shareMedicalRecord(
        recordId: recordId,
      );
      log('Response in shareMedicalRecord: $response');
      final sharedRecordInfo = SharedRecordInfoModel.fromJson(
        response['data'],
      ).toEntity();
      return Right(sharedRecordInfo);
    } on DioException catch (e) {
      log('Error in RecordRepoImpl : shareMedicalRecord: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in RecordRepoImpl : shareMedicalRecord: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SharedMedicalRecordEntity>> getSharedMedicalRecord({
    required String shareToken,
  }) async {
    try {
      final response = await recordRemoteDataSource.getSharedMedicalRecord(
        shareToken: shareToken,
      );
      log('Response in getSharedMedicalRecord: $response');
      final sharedRecord = SharedMedicalRecordModel.fromJson(
        response['data'],
      ).toEntity();
      return Right(sharedRecord);
    } on DioException catch (e) {
      log('Error in RecordRepoImpl : getSharedMedicalRecord: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in RecordRepoImpl : getSharedMedicalRecord: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
