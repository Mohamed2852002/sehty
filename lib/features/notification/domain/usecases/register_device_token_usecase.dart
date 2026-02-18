import 'package:dartz/dartz.dart';
import 'package:sehty/core/errors/failure.dart';
import 'package:sehty/features/notification/domain/repositories/notification_repo.dart';

class RegisterDeviceTokenUseCase {
  final NotificationRepo notificationRepo;

  RegisterDeviceTokenUseCase({required this.notificationRepo});

  Future<Either<Failure, Unit>> call({
    required String token,
    required String platform,
  }) async {
    return await notificationRepo.registerDeviceToken(
      token: token,
      platform: platform,
    );
  }
}
