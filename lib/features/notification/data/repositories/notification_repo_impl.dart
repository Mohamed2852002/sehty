import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:sehty/features/notification/data/models/notification_model.dart';
import 'package:sehty/features/notification/domain/entities/notification_entity.dart';
import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationRemoteDataSource notificationRemoteDataSource;

  NotificationRepoImpl({required this.notificationRemoteDataSource});

  NotificationEntity _mapModelToEntity(NotificationModel model) {
    return NotificationEntity(
      id: model.id,
      title: model.title,
      body: model.body,
      type: model.type,
      isRead: model.isRead,
      createdAt: model.createdAt,
    );
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>>
  getListOfNotifications() async {
    try {
      final response = await notificationRemoteDataSource
          .getListOfNotifications();
      log('Response in getListOfNotifications: $response');
      final List<dynamic> data = response['data'] ?? [];
      final notifications = data
          .map((json) => _mapModelToEntity(NotificationModel.fromJson(json)))
          .toList();
      return Right(notifications);
    } on DioException catch (e) {
      log(
        'Error in NotificationRepoImpl : getListOfNotifications: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in NotificationRepoImpl : getListOfNotifications: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> registerDeviceToken({
    required String token,
    required String platform,
  }) async {
    try {
      final response = await notificationRemoteDataSource.registerDeviceToken(
        token: token,
        platform: platform,
      );
      log('Response in registerDeviceToken: $response');
      return const Right(unit);
    } on DioException catch (e) {
      log(
        'Error in NotificationRepoImpl : registerDeviceToken: ${e.toString()}',
      );
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      log(
        'Error in NotificationRepoImpl : registerDeviceToken: ${e.toString()}',
      );
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
