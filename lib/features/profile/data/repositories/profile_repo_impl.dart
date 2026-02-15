import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:sehty/features/profile/data/models/chronic_disease_model.dart';
import 'package:sehty/features/profile/data/models/profile_model.dart';
import 'package:sehty/features/profile/data/models/surgery_model.dart';
import 'package:sehty/features/profile/domain/entities/chronic_disease_entity.dart';
import 'package:sehty/features/profile/domain/entities/profile_entity.dart';
import 'package:sehty/features/profile/domain/entities/surgery_entity.dart';
import 'package:sehty/features/profile/domain/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl({required this.profileRemoteDataSource});

  ProfileEntity _mapProfileModelToEntity(ProfileModel model) {
    return ProfileEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      patientCode: model.patientCode,
      age: model.age,
      gender: model.gender,
      weight: model.weight,
      governorate: model.governorate,
      district: model.district,
      dataSharingConsent: model.dataSharingConsent,
      chronicDiseases: model.chronicDiseases
          ?.map(
            (c) => ChronicDiseaseEntity(
              id: c.id,
              nameAr: c.nameAr,
              nameEn: c.nameEn,
            ),
          )
          .toList(),
      surgeries: model.surgeries
          ?.map(
            (s) => SurgeryEntity(
              id: s.id,
              surgeryName: s.surgeryName,
              surgeryDate: s.surgeryDate,
              createdAt: s.createdAt,
            ),
          )
          .toList(),
      createdAt: model.createdAt,
    );
  }

  ChronicDiseaseEntity _mapChronicDiseaseModelToEntity(
    ChronicDiseaseModel model,
  ) {
    return ChronicDiseaseEntity(
      id: model.id,
      nameAr: model.nameAr,
      nameEn: model.nameEn,
    );
  }

  SurgeryEntity _mapSurgeryModelToEntity(SurgeryModel model) {
    return SurgeryEntity(
      id: model.id,
      surgeryName: model.surgeryName,
      surgeryDate: model.surgeryDate,
      createdAt: model.createdAt,
    );
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final response = await profileRemoteDataSource.getProfile();
      log('Response in getProfile: $response');
      final profile = _mapProfileModelToEntity(
        ProfileModel.fromJson(response['data']),
      );
      return Right(profile);
    } on DioException catch (e) {
      log('Error in ProfileRepoImpl : getProfile: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in ProfileRepoImpl : getProfile: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile({
    required String name,
    required String phone,
    required int age,
    required String gender,
    required String governorate,
    required double weight,
    required String district,
    required List<int> chronicDiseases,
  }) async {
    try {
      final response = await profileRemoteDataSource.updateProfile(
        name: name,
        phone: phone,
        age: age,
        gender: gender,
        governorate: governorate,
        weight: weight,
        district: district,
        chronicDiseases: chronicDiseases,
      );
      log('Response in updateProfile: $response');
      final profile = _mapProfileModelToEntity(
        ProfileModel.fromJson(response['data']),
      );
      return Right(profile);
    } on DioException catch (e) {
      log('Error in ProfileRepoImpl : updateProfile: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in ProfileRepoImpl : updateProfile: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SurgeryEntity>> addSurgery({
    required String surgeryName,
    required String surgeryDate,
  }) async {
    try {
      final response = await profileRemoteDataSource.addSurgery(
        surgeryName: surgeryName,
        surgeryDate: surgeryDate,
      );
      log('Response in addSurgery: $response');
      final surgery = _mapSurgeryModelToEntity(
        SurgeryModel.fromJson(response['data']),
      );
      return Right(surgery);
    } on DioException catch (e) {
      log('Error in ProfileRepoImpl : addSurgery: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in ProfileRepoImpl : addSurgery: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChronicDiseaseEntity>>>
  getListOfChronicDiseases() async {
    try {
      final response = await profileRemoteDataSource.getListOfChronicDiseases();
      log('Response in getListOfChronicDiseases: $response');
      final List<dynamic> data = response['data'] ?? [];
      final chronicDiseases = data
          .map(
            (json) => _mapChronicDiseaseModelToEntity(
              ChronicDiseaseModel.fromJson(json),
            ),
          )
          .toList();
      return Right(chronicDiseases);
    } on DioException catch (e) {
      log(
        'Error in ProfileRepoImpl : getListOfChronicDiseases: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in ProfileRepoImpl : getListOfChronicDiseases: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
