import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/core/utils/app_constants.dart';
import 'package:sehty/features/auth/data/models/user_model.dart';
import 'package:sehty/features/auth/domain/entities/user_entity.dart';
import 'package:sehty/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sehty/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final FlutterSecureStorage flutterSecureStorage;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.flutterSecureStorage,
  });

  @override
  Future<Either<Failure, Unit>> sendLoginOtp({required String phone}) async {
    try {
      final response = await authRemoteDataSource.sendLoginOtp(phone: phone);
      log('Response in sendLoginOtp: $response');
      return const Right(unit);
    } on DioException catch (e) {
      log('Error in AuthRepoImpl : sendLoginOtp: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in AuthRepoImpl : sendLoginOtp: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await authRemoteDataSource.login(phone: phone, otp: otp);
      log('Response in login: $response');
      await saveToken(response['data']['token']);
      return Right(UserModel.fromJson(response['data']['user']));
    } on DioException catch (e) {
      log('Error in AuthRepoImpl : login: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in AuthRepoImpl : login: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  @override
  Future<Either<Failure, Unit>> sendRegisterOtp({required String phone}) async {
    try {
      final response = await authRemoteDataSource.sendRegisterOtp(phone: phone);
      log('Response in sendRegisterOtp: $response');
      return const Right(unit);
    } on DioException catch (e) {
      log('Error in AuthRepoImpl : sendRegisterOtp: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in AuthRepoImpl : sendRegisterOtp: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String phone,
    required String name,
    required String otp,
    required int age,
    required String gender,
    required double weight,
    required String governorate,
    required String district,
    required List<int> chronicDiseases,
    required bool dataSharingConsent,
  }) async {
    try {
      final response = await authRemoteDataSource.register(
        phone: phone,
        name: name,
        otp: otp,
        age: age,
        gender: gender,
        weight: weight,
        governorate: governorate,
        district: district,
        chronicDiseases: chronicDiseases,
        dataSharingConsent: dataSharingConsent,
      );
      log('Response in register: $response');
      await saveToken(response['data']['token']);
      return Right(UserModel.fromJson(response['data']['user']));
    } on DioException catch (e) {
      log('Error in AuthRepoImpl : register: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in AuthRepoImpl : register: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> saveToken(String token) async {
    await flutterSecureStorage.write(key: AppConstants.kToken, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await flutterSecureStorage.read(key: AppConstants.kToken);
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await authRemoteDataSource.logout();
      await flutterSecureStorage.delete(key: AppConstants.kToken);
      return const Right(unit);
    } on DioException catch (e) {
      log('Error in AuthRepoImpl : logout: ${e.toString()}');
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log('Error in AuthRepoImpl : logout: ${e.toString()}');
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
