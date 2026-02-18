import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/notification/domain/entities/notification_entity.dart';
import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';

class GetNotificationsUseCase {
  final NotificationRepo notificationRepo;

  GetNotificationsUseCase({required this.notificationRepo});

  Future<Either<Failure, List<NotificationEntity>>> call() async {
    return await notificationRepo.getListOfNotifications();
  }
}
