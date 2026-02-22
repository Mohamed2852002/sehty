import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/core/services/firebase_messaging_service.dart';
import 'package:sehty/features/notification/data/datasources/notification_remote_data_source.dart';
import 'package:sehty/features/notification/data/models/notification_model.dart';
import 'package:sehty/features/notification/domain/entities/notification_entity.dart';
import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationRemoteDataSource notificationRemoteDataSource;
  final FirebaseMessagingService firebaseMessagingService;

  NotificationRepoImpl({
    required this.notificationRemoteDataSource,
    required this.firebaseMessagingService,
  });

  @override
  Stream<String> get onTokenRefresh => firebaseMessagingService.onTokenRefresh;

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
      final dynamic rawData = response['data'];
      List<dynamic> data = [];
      if (rawData is List) {
        data = rawData;
      } else if (rawData is Map) {
        data = rawData['notifications'] ?? rawData['data'] ?? [];
      }

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
