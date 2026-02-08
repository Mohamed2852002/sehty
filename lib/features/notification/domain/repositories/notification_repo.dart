import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/notification/domain/entities/notification_entity.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationEntity>>> getListOfNotifications();

  Future<Either<Failure, Unit>> registerDeviceToken({
    required String token,
    required String platform,
  });
}
