import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/monitor/data/datasources/monitor_remote_data_source.dart';
import 'package:sehty/features/monitor/data/models/family_member_model/family_member_model.dart';
import 'package:sehty/features/monitor/data/models/family_member_model/patient.dart';
import 'package:sehty/features/monitor/data/models/family_member_medications_model/family_member_medications_model.dart';
import 'package:sehty/features/monitor/data/models/family_member_medications_model/statistics.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/family_member_medication_entity.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/patient_entitiy.dart';
import 'package:sehty/features/monitor/domain/entities/family_member_medication/statistics_entity.dart';
import 'package:sehty/features/monitor/domain/repositories/monitor_repo.dart';

class MonitorRepoImpl implements MonitorRepo {
  final MonitorRemoteDataSource monitorRemoteDataSource;

  MonitorRepoImpl({required this.monitorRemoteDataSource});

  PatientEntity _mapPatientToEntity(Patient? patient) {
    if (patient == null) return const PatientEntity();
    return PatientEntity(
      id: patient.id,
      name: patient.name,
      patientCode: patient.patientCode,
      phone: patient.phone,
    );
  }

  StatisticsEntity _mapStatisticsToEntity(Statistics? statistics) {
    if (statistics == null) return const StatisticsEntity();
    return StatisticsEntity(
      totalToday: statistics.totalToday,
      takenToday: statistics.takenToday,
      untakenToday: statistics.untakenToday,
      percentage: statistics.percentage,
    );
  }

  FamilyMemberEntity _mapFamilyMemberModelToEntity(FamilyMemberModel model) {
    return FamilyMemberEntity(
      id: model.id,
      relationship: model.relationship,
      status: model.status,
      name: model.name,
      phone: model.phone,
      totalToday: model.totalToday,
      takenToday: model.takenToday,
      untakenToday: model.untakenToday,
      percentage: model.percentage,
      invitedAt: model.invitedAt,
      approvedAt: model.approvedAt,
      patient: _mapPatientToEntity(model.patient),
    );
  }

  FamilyMemberMedicationsEntity _mapFamilyMemberMedicationsModelToEntity(
    FamilyMemberMedicationsModel model,
  ) {
    return FamilyMemberMedicationsEntity(
      patient: _mapPatientToEntity(model.patient),
      statistics: _mapStatisticsToEntity(model.statistics),
      medications: model.medications,
    );
  }

  @override
  Future<Either<Failure, List<FamilyMemberEntity>>>
  getListOfFamilyConnections() async {
    try {
      final response = await monitorRemoteDataSource
          .getListOfFamilyConnections();
      log('Response in getListOfFamilyConnections: $response');
      final dynamic rawData = response['data'];
      List<dynamic> data = [];
      if (rawData is List) {
        data = rawData;
      } else if (rawData is Map) {
        data =
            (rawData['connections'] ?? rawData['data'] ?? []) as List<dynamic>;
      }

      final members = data
          .map(
            (json) =>
                _mapFamilyMemberModelToEntity(FamilyMemberModel.fromJson(json)),
          )
          .toList();
      return Right(members);
    } on DioException catch (e) {
      log(
        'Error in MonitorRepoImpl : getListOfFamilyConnections: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in MonitorRepoImpl : getListOfFamilyConnections: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FamilyMemberMedicationsEntity>>
  showOneFamilyMedication({required int memberId}) async {
    try {
      final response = await monitorRemoteDataSource.showOneFamilyMedication(
        memberId: memberId,
      );
      log('Response in showOneFamilyMedication: $response');
      final memberMedications = _mapFamilyMemberMedicationsModelToEntity(
        FamilyMemberMedicationsModel.fromJson(response['data']),
      );
      return Right(memberMedications);
    } on DioException catch (e) {
      log(
        'Error in MonitorRepoImpl : showOneFamilyMedication: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in MonitorRepoImpl : showOneFamilyMedication: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FamilyMemberEntity>> inviteFamilyMember({
    required String phone,
    required String relationship,
  }) async {
    try {
      final response = await monitorRemoteDataSource.inviteFamilyMember(
        phone: phone,
        relationship: relationship,
      );
      log('Response in inviteFamilyMember: $response');
      final member = _mapFamilyMemberModelToEntity(
        FamilyMemberModel.fromJson(response['data']),
      );
      return Right(member);
    } on DioException catch (e) {
      log('Error in MonitorRepoImpl : inviteFamilyMember: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in MonitorRepoImpl : inviteFamilyMember: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FamilyMemberEntity>> addNewMember({
    required String name,
    required String phone,
    required String relationship,
  }) async {
    try {
      final response = await monitorRemoteDataSource.addNewMember(
        name: name,
        phone: phone,
        relationship: relationship,
      );
      log('Response in addNewMember: $response');
      final member = _mapFamilyMemberModelToEntity(
        FamilyMemberModel.fromJson(response['data']),
      );
      return Right(member);
    } on DioException catch (e) {
      log('Error in MonitorRepoImpl : addNewMember: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in MonitorRepoImpl : addNewMember: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> approveFamilyInvitation({
    required int invitationId,
  }) async {
    try {
      final response = await monitorRemoteDataSource.approveFamilyInvitation(
        invitationId: invitationId,
      );
      log('Response in approveFamilyInvitation: $response');
      return const Right(unit);
    } on DioException catch (e) {
      log(
        'Error in MonitorRepoImpl : approveFamilyInvitation: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in MonitorRepoImpl : approveFamilyInvitation: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
